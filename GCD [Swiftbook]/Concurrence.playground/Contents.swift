import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// MARK: Стандартные очереди

let mainQueue = DispatchQueue.main
let qos0GlobalQueue = DispatchQueue.global(qos: .unspecified)
let qos1GlobalQueue = DispatchQueue.global(qos: .background)
let qos2GlobalQueue = DispatchQueue.global(qos: .utility)
let qos3GlobalQueue = DispatchQueue.global(qos: .default)
let qos4GlobalQueue = DispatchQueue.global(qos: .userInitiated)
let qos5GlobalQueue = DispatchQueue.global(qos: .userInteractive)

// MARK: Критические секции

class ThreadSafeArray<T>{
    var array = [T]()
    let queue = DispatchQueue(label: "SafeArrayQueue", attributes: .concurrent)
    
    func append(_ element: T){
        queue.async(flags: .barrier) {
            self.array.append(element)
        }
    }
    func elements() -> [T]{
        var result = [T]()
        queue.sync{
            result = self.array
        }
        return result
    }
}

// MARK: Распараллеливание циклов

func concurentInterations(){
    var arr = [Int]()
    let safeArr = ThreadSafeArray<Int>()
    
    DispatchQueue.concurrentPerform(iterations: 10, execute: {index in
        arr.append(index)
    })
    DispatchQueue.concurrentPerform(iterations: 10, execute: {index in
        safeArr.append(index)
    })
    print("Simple arr: \(arr)")
    print("Thread safe arr: \(safeArr.elements())")
}

// MARK: Распраллеливание обычных задач

func concurentTasks(){
    let simpleQueue = DispatchQueue(label: "simpleQueue",
                                    qos: .utility,
                                    attributes: .concurrent)
    simpleQueue.async {
        for i in 1...10{
            print("First clouser: task\(i)")
            sleep(UInt32(i))
        }
    }
    simpleQueue.async {
        for i in 1...10{
            print("Second clouser: task\(i)")
            sleep(UInt32(10 - i))
        }
    }
}

// MARK: Группы событий

func groups(){
    let queue = DispatchQueue(label: "GroupsQueue", attributes: .concurrent)
    
    let firstGroup = DispatchGroup()

    firstGroup.notify(queue: .main) {
        print("Notifying message!")
    }
    firstGroup.enter()
    queue.asyncAfter(deadline: .now() + 4) {
        print("First group - task #1")
        firstGroup.leave()
    }
    queue.async(group: firstGroup) {
        print("First group - task #2")
    }
    print("Not last printed message")
}

// MARK: Ожидание групп по таймауту

func groupsWait(){
    let group = DispatchGroup()
    let queue = DispatchQueue(label: "waitTestQueue", attributes: .concurrent)
    
    queue.async(group: group) {
        sleep(2)
    }
    
    let maxWaitTime = 3
    let waitResult = group.wait(timeout: .now() + .seconds(maxWaitTime))
    print("This label will print after not longer \(maxWaitTime)")
    if waitResult == .success {
        print("We wait for group")
    } else {
        print("We didn't wait for group")
    }
}

// MARK: Блоки

func blocks(){
    let block = DispatchWorkItem(qos: .utility) {
        print("Label from the block")
    }
    let queue = DispatchQueue(label: "workItemQueue",
                              qos: .userInteractive,
                              attributes: .concurrent)
    
    queue.asyncAfter(deadline: .now() + 2, execute: block)
    let waitResult = block.wait(timeout: .now() + 1)
    if waitResult == .timedOut{
        block.cancel()
        print("Block is cancelled = \(block.isCancelled)")
    }
}

// MARK: Семафоры

func semaphoreTest(){
    let queue = DispatchQueue(label: "semaphoreQueue", attributes: .concurrent)
    let semaphore = DispatchSemaphore(value: 2)
    
    func task(for duration: Int, with number: Int){
        semaphore.wait(timeout: .distantFuture)
        Thread.sleep(forTimeInterval: TimeInterval(duration))
        print("Task \(number)")
        semaphore.signal()
    }
    
    queue.async(execute: { task(for: 5, with: 1) })
    queue.async(execute: { task(for: 2, with: 2) })
    queue.async(execute: { task(for: 1, with: 3) })
    queue.async(execute: { task(for: 1, with: 4) })
}

// MARK: Отслеживание событий

func sourceTest(){
    let queue = DispatchQueue(label: "dispathSourceQueue", attributes: .concurrent)
    let source = DispatchSource.makeTimerSource(queue: queue)
    source.schedule(deadline: .now(), repeating: 1)
    source.setEventHandler {
        print("Tick")
        print("Tack")
    }
    source.setCancelHandler {
        print("Timer was cancelled")
    }
    source.resume()
    sleep(5)
    source.cancel()
}

sourceTest()

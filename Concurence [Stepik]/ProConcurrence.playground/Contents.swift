import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// MARK: Threads

func UNIXThredsTest(){
    let pthread = Thread {
        print("Hello from thread with qos\(qos_class_self().rawValue)")
    }
    pthread.qualityOfService = .userInitiated
    pthread.start()
}

// MARK: Mutex

func mutexTest(){
    let mutex = NSLock()
    
    var someVar = 0
    func doGreater(){
        mutex.lock()
        for _ in 1...100{
            someVar += 1
        }
        mutex.unlock()
    }
    let thread1 = Thread {
        doGreater()
        print(someVar)
    }
    let thread2 = Thread {
        doGreater()
        print(someVar)
    }
    thread1.start()
    thread2.start()
}

// MARK: Recursive mutex

func recursiveMutexTest(){
    let mutex = NSRecursiveLock()
    
    func firstFoo(){
        mutex.lock()
        secondFoo()
        mutex.unlock()
    }
    func secondFoo(){
        mutex.lock()
        print("Where is deadlock?")
        mutex.unlock()
    }
    
    firstFoo()
}

// MARK: Condition

func conditionTest(){
    let condition = NSCondition()
    var check = false
    
    func firstFoo(){
        condition.lock()
        while !check{
            condition.wait()
        }
        print("Receive some signal")
        condition.unlock()
    }
    
    func secondFoo(){
        condition.lock()
        print("Send the signal")
        check = true
        condition.signal()
        condition.unlock()
    }
    
    let thread = Thread {
        firstFoo()
    }
    thread.start()
    secondFoo()
}

// MARK: Atomic operations

var i: Int64 = 7
OSAtomicCompareAndSwap64(i, 2, &i)
OSAtomicIncrement64Barrier(&i)


// MARK: Operations

func operationsTest(){
    let queue = OperationQueue()
    class CustomOperation: Operation{
        override func main() {
            print("#3 - Hi from custom operation")
        }
    }
    let operation = BlockOperation{ print("#1 - Hi from standart operation") }
    let customOp = CustomOperation()
    
    customOp.completionBlock = {
        print("Complition block for custom operation")
    }
    
    operation.addDependency(customOp)
    
    queue.addOperation(customOp)
    queue.addOperation(operation)
    
    queue.addOperation {
        print("#2 - Hi from inline closure")
    }
}

// MARK: Async Operation

class AsyncOperation: Operation{
    override var isAsynchronous: Bool { return true }
    
    private var _isExecuting = false
    private var _isFinished = false
    
    override var isExecuting: Bool { return _isExecuting }
    override var isFinished: Bool { return _isFinished }
    
    private var queue = DispatchQueue(label: "OperationQueue", attributes: .concurrent)
    
    override func main() {
        sleep(5)
        print("Hi from async operation!")
        
        willChangeValue(forKey: "isExecuting")
        willChangeValue(forKey: "isFinished")
        _isExecuting = false
        _isFinished = true
        didChangeValue(forKey: "isExecuting")
        didChangeValue(forKey: "isFinished")
    }
    
    override func start(){
        willChangeValue(forKey: "isExecuting")
        queue.async {
            self.main()
        }
        _isExecuting = true
        didChangeValue(forKey: "isExecuting")
    }
}

func asyncOperationTest(){
    let operation = AsyncOperation()
    operation.start()
    print("Hello from main thread!")
}

// MARK: Cancelable operation

class CancelableOperation: Operation{
    
    override func main() {
        let count = 5
        
        for i in 1...count{
            let isCancelled = sleepStep(for: 1, iteration: i)
            if isCancelled { return }
        }
    }
    func sleepStep(for seconds: UInt32, iteration: Int) -> Bool{
        sleep(seconds)
        if isCancelled{
            print("Operation was cancelled on iteration #\(iteration)")
            return true
        }
        
        return false
    }
}

func cancelableOperationTest(){
    let queue = OperationQueue()
    let op = CancelableOperation()
    queue.addOperation(op)
    
    sleep(3)
    op.cancel()
}

// MARK: OperationQueue

func operationQueueTest(){
    let queue = OperationQueue()
    queue.maxConcurrentOperationCount = 1
    
    let op1 = BlockOperation{
        for i in 1...10 {
            print("#\(i)")
        }
    }
    let op2 = BlockOperation{
        for i in 11...20 {
            print("#\(i)")
        }
    }
    queue.addOperation(op1)
    queue.addOperation(op2)
    queue.isSuspended = true
    sleep(3)
    queue.isSuspended = false
}

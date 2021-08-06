
class Tree<T>{
    var left: Tree<T>?
    var right: Tree<T>?
    var value: T
    
    init(_ value: T){
        self.value = value
    }
    
    enum IterationOrder{
        case preOrder
        case postOrder
        case inOrder
    }
    
    func iterator(_ order: IterationOrder) -> AnyIterator<T>{
        var items = [T]()
        switch order {
        case .preOrder:
            preOrder{ items.append($0) }
        case .postOrder:
            postOrder{ items.append($0) }
        case .inOrder:
            inOrder{ items.append($0) }
        }
        
        return AnyIterator(items.makeIterator())
    }
    
    func preOrder(_ body: (T) -> ()){
        body(value)
        left?.preOrder(body)
        right?.preOrder(body)
    }
    
    func postOrder(_ body: (T) -> ()){
        left?.postOrder(body)
        right?.postOrder(body)
        body(value)
    }
    
    func inOrder(_ body: (T) -> ()){
        left?.inOrder(body)
        body(value)
        right?.inOrder(body)
    }
}


let head = Tree(1)
let node1 = Tree(2)
let leaf1 = Tree(3)
let leaf2 = Tree(4)
let leaf3 = Tree(5)

head.left = node1
head.right = leaf1
node1.left = leaf2
node1.right = leaf3

let iterators = [
    head.iterator(.preOrder),
    head.iterator(.postOrder),
    head.iterator(.inOrder)
]

for iterator in iterators{
    while let item = iterator.next(){
        print(item)
    }
    print()
}

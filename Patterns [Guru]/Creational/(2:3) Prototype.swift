class Shape: NSCopying{
    var x = 0.0
    var y = 0.0
    
    init() {}
    init(prototype: Shape){
        self.x = prototype.x
        self.y = prototype.y
    }
    func copy(with zone: NSZone? = nil) -> Any {
        return Shape(prototype: self)
    }
    func printDescription(){
        print("Shape [\(x), \(y)]")
    }
}

class Square: Shape{
    var sideSize = 0.0
    
    init() {}
    init(prototype: Square){
        self.sideSize = prototype.sideSize
        super.init(prototype: prototype)
    }
}

let array: Array<Shape> = [
    Shape(),
    Square(),
    Square()
]

var copies = Array<Shape>()
for element in array{
    if let copiedElement = element.copy() as? Shape{
        copies.append(copiedElement)
    }
}
for element in copies{
    element.printDescription()
}


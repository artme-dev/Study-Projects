
protocol Component {
    func isComposite() -> Bool
    
    func add(_ component: Component)
    func remove(_ component: Component)
    
    func operation() -> String
}

extension Component {
    func isComposite() -> Bool{
        return false
    }
    func add(_ component: Component) { }
    func remove(_ component: Component) { }
}

class Composite: Component{
    var childrent = [Component]()
    func add(_ component: Component) {
        childrent.append(component)
    }
    func remove(_ component: Component) {
        print("Cannnot remove anything!")
    }
    func isComposite() -> Bool{
        return true
    }
    func operation() -> String{
        var result = "("
        for (index, item) in childrent.enumerated(){
            result += item.operation()
            if(index == childrent.count - 1){
                result += ")"
            } else {
                result += ","
            }
            
        }
        return result
    }
}

class Leaf: Component{
    func operation() -> String{
        return "X"
    }
}


let leaf1 = Leaf()
let leaf2 = Leaf()
let leaf3 = Leaf()
let composite1 = Composite()
let composite2 = Composite()

composite1.add(leaf1)
composite1.add(leaf2)
composite2.add(leaf3)
composite2.add(composite1)

print(composite2.operation())

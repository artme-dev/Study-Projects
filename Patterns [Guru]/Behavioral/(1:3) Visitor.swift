
protocol Component {
    func accept(visitor: Visitor)
}

class ComponentA: Component{
    func accept(visitor: Visitor){
        visitor.visit(component: self)
    }
}

class ComponentB: Component{
    func accept(visitor: Visitor){
        visitor.visit(component: self)
    }
}

protocol Visitor{
    func visit(component: ComponentA)
    func visit(component: ComponentB)
}

class SuperVisitor: Visitor{
    func visit(component: ComponentA){
        print("Visit component A")
    }
    func visit(component: ComponentB){
        print("Visit component B")
    }
}

let visitor = SuperVisitor()
ComponentA().accept(visitor: visitor)
ComponentB().accept(visitor: visitor)


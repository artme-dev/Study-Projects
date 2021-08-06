protocol Component {
    func prepare(_ value: String) -> String
}
class ConcreteComponent: Component{
    func prepare(_ value: String) -> String{
        return value
    }
}
class Decorator: Component{
    private var component: Component
    init(_ component: Component){
        self.component = component
    }
    func prepare(_ value: String) -> String{
        return component.prepare(value)
    }
}
class ToUpperCaseDecorator: Decorator{
    override func prepare(_ value: String) -> String{
        return super.prepare(value).uppercased()
    }
}
class TitleDecorator: Decorator{
    override func prepare(_ value: String) -> String{
        return "--- " + super.prepare(value) + " ---"
    }
}

let value = "Hello"
let component = ConcreteComponent()
print(component.prepare(value))
let halfDecoratedComponent = ToUpperCaseDecorator(component)
print(halfDecoratedComponent.prepare(value))
let fullDecoratedComponent = TitleDecorator(halfDecoratedComponent)
print(fullDecoratedComponent.prepare(value))

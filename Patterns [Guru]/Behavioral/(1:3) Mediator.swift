
protocol Mediator: AnyObject {
    func notify(sender: BaseComponent, event: String)
}

class BaseComponent {
    fileprivate weak var mediator: Mediator?
    
    func update(mediator: Mediator){
        self.mediator = mediator
    }
}

class FirstComponent: BaseComponent{
    func doA(){
        print("First component did A")
        mediator?.notify(sender: self, event: "A")
    }
    func doB(){
        print("First component did B")
        mediator?.notify(sender: self, event: "B")
    }
}

class SecondComponent: BaseComponent{
    func doC(){
        print("Second component did C")
        mediator?.notify(sender: self, event: "C")
    }
    func doD(){
        print("Second component did D")
        mediator?.notify(sender: self, event: "D")
    }
}

class ConcreteMediator: Mediator {
    var component1 = FirstComponent()
    var component2 = SecondComponent()
    
    init(c1: BaseComponent, c2: BaseComponent){
        let component1 = c1
        let component2 = c2
        component1.update(mediator: self)
        component2.update(mediator: self)
    }
    
    func notify(sender: BaseComponent, event: String){
        if event == "A" {
            print("Mediator reacts on A")
            self.component2.doC()
        }
        else if (event == "D") {
            print("Mediator reacts on D")
            self.component1.doB()
            self.component2.doC()
        }
    }
}

let firstComponent = FirstComponent()
let secondComponent = SecondComponent()
let mediator = ConcreteMediator(c1: firstComponent, c2: secondComponent)

firstComponent.doA()
print()
secondComponent.doD()

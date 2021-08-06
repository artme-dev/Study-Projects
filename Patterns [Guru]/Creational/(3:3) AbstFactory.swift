protocol Button {
    func show()
}
protocol CheckBox {
    func show()
}
class MacButton: Button{
    func show(){
        print("""
                                ----------
        It's a Mac button ->    | Button |
                                ----------
        """)
    }
}
class WinButton: Button{
    func show(){
        print("""
                                ~~~~~~~~~~
        It's a Win button ->    / Button \\
                                ~~~~~~~~~~
        """)
    }
}

class MacCheckBox: CheckBox{
    func show(){
        print("""
                                    -----
        It's a Mac checkbox ->      | x |
                                    -----
        """)
    }
}
class WinCheckBox: CheckBox{
    func show(){
        print("""
                                    ~~~~~
        It's a Win checkbox ->      / x \\
                                    ~~~~~
        """)
    }
}

protocol AbstractUIFabric {
    func createButton() -> Button
    func createCheckbox() -> CheckBox
}

class MacUIFabric: AbstractUIFabric {
    func createButton() -> Button {
        return MacButton()
    }
    func createCheckbox() -> CheckBox {
        return MacCheckBox()
    }
}

class WinUIFabric: AbstractUIFabric {
    func createButton() -> Button {
        return WinButton()
    }
    func createCheckbox() -> CheckBox {
        return WinCheckBox()
    }
}

func showUIExamples(using fabric: AbstractUIFabric){
    let button = fabric.createButton()
    let checkbox = fabric.createCheckbox()
    
    button.show()
    checkbox.show()
}

func printHint(){
    print("Required flags: '-mac' or '-win'")
}

func main(){
    guard CommandLine.argc == 2 else {
        printHint()
        return
    }
    let flag = CommandLine.arguments[1]
    var fabric: AbstractUIFabric?
    
    switch flag {
    case "-mac":
        fabric = MacUIFabric()
    case "-win":
        fabric = WinUIFabric()
    default:
        printHint()
    }
    
    if let fabric = fabric{
        showUIExamples(using: fabric)
    }
}

main()

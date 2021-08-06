
protocol Memento {
    var name: String { get }
    var date: String { get }
}

class CustomTextView{
    var currentText: String?
    var currentTextColor: String?
    var cursorPosition: Int?
    
    init(currentText: String,
         currentTextColor: String? = nil,
         cursorPosition: Int? = nil) {
        self.currentText = currentText
        self.currentTextColor = currentTextColor
        self.cursorPosition = cursorPosition
    }
    
    func createMemento(name: String) -> Memento{
        return TextViewMemento(
            name: name,
            text: currentText,
            textColor: currentTextColor,
            cursorPosition: cursorPosition)
    }
    
    func restore(from memento: Memento){
        guard let textMemento = memento as? TextViewMemento else{
            print("Caanot be resored from not TextViewMemento")
            return
        }
        
        currentText = textMemento.text
        currentTextColor = textMemento.textColor
        cursorPosition = textMemento.cursorPosition
    }
    
    struct TextViewMemento: Memento{
        let date = "Now"
        let name: String
        
        let text: String?
        let textColor: String?
        let cursorPosition: Int?
    }
    
    var description: String{
        return """
        ----
            text: \(currentText ?? "")
            color: \(currentTextColor ?? "")
        """
    }
}

let view = CustomTextView(currentText: "Hello, world!",
                          currentTextColor: "Green")

let memento = view.createMemento(name: "First memento")
view.currentText = "Goodbye!"
view.currentTextColor = "Blue"
print(view.description)
view.restore(from: memento)
print(view.description)


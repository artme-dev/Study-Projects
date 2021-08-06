
protocol Request {
    var firstName: String? { get }
    var secondName: String? { get }
    var email: String? { get }
    var city: String? { get }
}

enum RequestError: String, Error{
    case InvalidName
    case InvalidEmail
    case InvalidAddress
}

protocol Handler {
    var next: Handler? { get }
    func handle(_ request: Request) -> RequestError?
}

class BaseHandler: Handler{
    var next: Handler?
    
    init(with handler: Handler? = nil){
        self.next = handler
    }
    
    func handle(_ request: Request) -> RequestError?{
        return next?.handle(request)
    }
}

class NameHandler: BaseHandler{
    override func handle(_ request: Request) -> RequestError?{
        guard
            let firstName = request.firstName,
            let secondName = request.secondName,
            firstName.isEmpty == false,
            secondName.isEmpty == false
        else{
            return .InvalidName
        }
        return next?.handle(request)
    }
}

class AdressHandler: BaseHandler{
    override func handle(_ request: Request) -> RequestError?{
        guard
            let city = request.city,
            city.isEmpty == false,
            city == "Novosibirsk"
        else{
            return .InvalidAddress
        }
        return next?.handle(request)
    }
}

class EmailHandler: BaseHandler{
    override func handle(_ request: Request) -> RequestError?{
        guard
            let email = request.email,
            email.isEmpty == false,
            email.contains("@")
        else{
            return .InvalidEmail
        }
        return next?.handle(request)
    }
}

class BaseRequest: Request{
    let firstName: String?
    let secondName: String?
    let email: String?
    let city: String?
    
    init(firstName: String? = nil,
         secondName: String? = nil,
         email: String? = nil,
         city: String? = "Novosibirsk"){
        self.firstName = firstName
        self.secondName = secondName
        self.email = email
        self.city = city
    }
}

func go(){
    let requests = [
        BaseRequest(firstName: "Artem",
                    secondName: "Kononov",
                    email: "art@ya.ru"),
        BaseRequest(firstName: "Artem",
                    secondName: "Kononov",
                    email: "art@ya.ru",
                    city: "Tomsk"),
        BaseRequest(firstName: "Artem",
                    secondName: "",
                    email: "art@ya.ru"),
        BaseRequest(firstName: "Artem",
                    secondName: "Kononov",
                    email: "art-ya.ru")
    ]
    
    let chain = NameHandler(with: AdressHandler(with: EmailHandler()))
    
    for request in requests{
        dump(request)
        if let error = chain.handle(request){
            print("Error occurred: \(error)")
        }
        print()
    }
}

go()

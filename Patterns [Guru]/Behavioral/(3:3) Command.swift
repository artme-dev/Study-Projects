
protocol Command {
    func execute()
}

class SendAuthRequest: Command{
    let login: String
    let password: String
    
    init(login: String, password: String){
        self.login = login
        self.password = password
    }
    
    func execute(){
        print("Sending AuthRequest: \(login)-\(password)")
    }
}

func siriShortCut(){
    let request = SendAuthRequest(login: "a", password: "1")
    request.execute()
}

func userGuestureRecognizer(){
    let request = SendAuthRequest(login: "b", password: "2")
    request.execute()
}

func delayedOperationExecution(){
    let request = SendAuthRequest(login: "c", password: "3")
    request.execute()
}

siriShortCut()
userGuestureRecognizer()
delayedOperationExecution()

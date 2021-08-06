protocol Authorization {
    func sendAuthRequest(login: String, password: String)
}
class InitialView {
    init(_ authService: Authorization){
        let inputLogin = "123"
        let inputPassword = "qwe"
        authService.sendAuthRequest(login: inputLogin, password: inputPassword)
    }
}

class TwitterSDK{
    func sendAuthRequest(login: String, password: String){
        print("Autorization via Twitter")
    }
}
class FacebookSDK{
    func startAuth(authData: String){
        print("Autorization via Facebook")
    }
}


extension TwitterSDK: Authorization { }

extension FacebookSDK: Authorization {
    func sendAuthRequest(login: String, password: String){
        self.startAuth(authData: login + password)
    }
}

let firstView = InitialView(TwitterSDK())
let secondView = InitialView(FacebookSDK())


class Singleton{
    
    static let shared = Singleton()
    private init() {}
}

let instance1 = Singleton.shared
let instance2 = Singleton.shared

if(instance1 === instance2){
    print("Singleton works well!")
}

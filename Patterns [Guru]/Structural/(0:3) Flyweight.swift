
enum AnimalType{
    case cat
    case dog
}

struct Appearence{
    let photo: String
    let color: String
}

class AppearenceFactory{
    static var cache = [AnimalType: Appearence]()
    
    static func get(for type: AnimalType) -> Appearence?{
        if let appearence = cache[type]{
            print("Reuse appereance")
            return appearence
        }
        switch type {
        case .dog:
            let dog = dogAppereance
            cache[.dog] = dog
            return dog
        case .cat:
            let cat = catAppearence
            cache[.cat] = cat
            return cat
        }
    }
}

extension AppearenceFactory{
    static var catAppearence: Appearence{
        print("Instance cat appereance")
        return Appearence(photo: "cat.png", color: "green")
    }
    static var dogAppereance: Appearence{
        print("Instance dog appereance")
        return Appearence(photo: "dog.png", color: "blue")
    }
}

class Animal{
    let name: String
    let type: AnimalType
    var appearence: Appearence{
        return AppearenceFactory.get(for: type)!
    }
    
    init(name: String, type: AnimalType){
        self.name = name
        self.type = type
    }
    
    func render(){
        print("Show \(name) with photo \(appearence.photo)")
    }
}

let array = [
    Animal(name: "Hasky", type: .dog),
    Animal(name: "Labrador", type: .dog),
    Animal(name: "Bulldog", type: .dog),
    Animal(name: "Persian", type: .cat),
    Animal(name: "Bengal", type: .cat),
]

for animal in array{
    animal.render()
}

class WorldStorage{
    func getHi() -> String{
        return "Hi"
    }
    func getWorld() -> String{
        return "World"
    }
    func getPlanet() -> String{
        return "Planet"
    }
    func getHello() -> String{
        return "Hello"
    }
}

class SymbolStorage{
    func get1() -> String{
        return "!"
    }
    func get2() -> String{
        return ","
    }
    func get3() -> String{
        return "?"
    }
    func getSpace() -> String{
        return " "
    }
}

class GreetingConstructor{
    let worldStorage = WorldStorage()
    let symbolStorage = SymbolStorage()
    
    func getHello() -> String{
        return worldStorage.getHello()
    }
    
    func getSpace() -> String{
        return symbolStorage.getSpace()
    }
    
    func getSimpleGreeting() -> String{
        var result = worldStorage.getHello()
        result += symbolStorage.get2()
        result += symbolStorage.getSpace()
        result += worldStorage.getWorld()
        return result
    }
}

let constructor = GreetingConstructor()
print(constructor.getSimpleGreeting())

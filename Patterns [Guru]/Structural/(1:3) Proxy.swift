
protocol Coder{
    func code(_: String) -> String
    func decode(_: String) -> String
}

class SimpleCoder: Coder{
    func code(_ phrase: String) -> String{
        return String(phrase.reversed())
    }
    
    func decode(_ phrase: String) -> String{
        return String(phrase.reversed())
    }
}

class CashedCoder: Coder{
    var cache = [String: String]()
    
    func code(_ phrase: String) -> String{
        return processPhrase(phrase)
    }
    
    func decode(_ phrase: String) -> String{
        return processPhrase(phrase)
    }
    
    func processPhrase(_ phrase: String) -> String{
        if let result = cache[phrase]{
            print("""
                    Translate from CACHE:
                    '\(phrase)' -> '\(result)'
                """)
            return result
        }
        let result = String(phrase.reversed())
        cache[phrase] = result
        return result
    }
}

func decodeSomething(using coder: Coder){
    let input = "dnuorgyalp ,olleH"
    let _ = coder.decode(input)
    let decodedInput = coder.decode(input)
    print(coder.code(decodedInput))
}

decodeSomething(using: CashedCoder())



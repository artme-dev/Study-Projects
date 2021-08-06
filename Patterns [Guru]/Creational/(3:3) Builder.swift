
protocol BaseElement { }

class BaseQueryBuilder<Element: BaseElement> {
    typealias Predicate = (Element) -> Bool
    
    @discardableResult
    func filter(_ codition: @escaping Predicate) -> BaseQueryBuilder<Element> {
        return self
    }
    @discardableResult
    func limit(_ limit: Int) -> BaseQueryBuilder<Element> {
        return self
    }
    func fetch() -> [Element] {
        return []
    }
}

class QueryBuilder<Element: BaseElement>: BaseQueryBuilder<Element>{
    
    enum Operations{
        case filter(Predicate)
        case limit(Int)
    }
    
    var addedOperations = [Operations]()
    
    @discardableResult
    override func filter(_ codition: @escaping Predicate) -> QueryBuilder<Element>{
        addedOperations.append(.filter(codition))
        return self
    }
    @discardableResult
    override func limit(_ limit: Int) -> QueryBuilder<Element>{
        addedOperations.append(.limit(limit))
        return self
    }
    override func fetch() -> [Element]{
        var result = ""
        var conditionCount = 0
        for operation in addedOperations{
            switch operation {
            case .filter:
                conditionCount += 1
                result += "Условие #\(conditionCount)\n"
            case .limit(let limit):
                result += "Ограничение \(limit)\n"
            }
        }
        print(result)
        return []
    }
}

class Model: BaseElement{ }
let builder = QueryBuilder<Model>()
builder.filter({(element: Model) in return true}).limit(7).filter{
    (element: Model) in
    return true
}
let result = builder.limit(99).limit(17).fetch()

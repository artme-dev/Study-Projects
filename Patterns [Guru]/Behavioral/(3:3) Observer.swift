
protocol Product {
    var id: Int { get }
    var name: String { get }
    var price: Double { get }
    
    func isEqual(to product: Product) -> Bool
}

extension Product{
    func isEqual(to product: Product) -> Bool{
        return product.id == self.id
    }
}

protocol Observer: AnyObject{
    func accept(changed products: [Product])
}

protocol Observable {
    func add(observer: Observer)
    func remove(observer: Observer)
    func remove(observer filter: (Observer) -> Bool)
    func notify()
}

class CartManager{
    var products = [Product]()
    func add(product: Product){
        products.append(product)
        notify()
    }
    
    var observers = [Observer]()
    func add(observer: Observer){
        observers.append(observer)
    }
    func remove(observer: Observer){
        guard let index = observers.firstIndex(where: {$0 === observer}) else { return }
        observers.remove(at: index)
    }
    func remove(observer filter: (Observer) -> Bool){
        guard let index = observers.firstIndex(where: filter) else { return }
        observers.remove(at: index)
    }
    func notify(){
        observers.forEach({ $0.accept(changed: products) })
    }
}

class UICartView: Observer{
    func accept(changed products: [Product]){
        print("/nNew cart state:")
        dump(products)
    }
}

class Banana: Product{
    static var nextID = 1
    
    var id: Int
    var name = "Banana"
    var price: Double
    
    init(price: Double){
        id = Banana.nextID
        Banana.nextID += 1
        self.price = price
    }
}

let asianBanana = Banana(price: 90.0)
let siberiaBanana = Banana(price: 55.0)

let cart = CartManager()
let view = UICartView()
cart.add(observer: view)

cart.add(product: asianBanana)
cart.add(product: siberiaBanana)

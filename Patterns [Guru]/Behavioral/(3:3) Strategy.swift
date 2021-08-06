
protocol Model {
    var id: Int { get }
    var description: String { get }
}
protocol DataStorage {
    func loadData<T: Model>() -> [T]
}

class MemoryStorage: DataStorage{
    func loadData<T: Model>() -> [T]{
        print("Loading [\(T.self)] from memory array...")
        return [T]()
    }
}

class CoreDataStorage: DataStorage{
    func loadData<T: Model>() -> [T]{
        print("Loading [\(T.self)] from core data...")
        return [T]()
    }
}

class RealmStorage: DataStorage{
    func loadData<T: Model>() -> [T]{
        print("Loading [\(T.self)] from remote server...")
        return [T]()
    }
}

struct User: Model{
    var id: Int
    var name: String
    
    var description: String{
        return String(id)
    }
}

class DataManager{
    var storage: DataStorage
    init(storage: DataStorage){
        self.storage = storage
    }
    
    func displayData(){
        let models = storage.loadData() as [User]
        models.forEach{ print($0.description) }
    }
}

let storage = CoreDataStorage()
let manager = DataManager(storage: storage)
manager.displayData()

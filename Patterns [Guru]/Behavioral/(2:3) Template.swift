
class PermissionAccessor{
    
    typealias Complition = (Bool) -> ()
    
    func requestAccessIfNeed(_ complition: @escaping Complition){
        guard !hasAccess() else {
            print("Access is already received")
            return
        }
        
        willRequestAccess()
        requestAccess{ [weak self] status in
            status ? self!.didReceiveAccess() : self!.didRejectAccess()
            complition(status)
        }
    }
    
    func requestAccess(_ complition: @escaping Complition){
        fatalError("Must be overridden")
    }
    
    func hasAccess() -> Bool{
        fatalError("Must be overridden")
    }
    
    func willRequestAccess(){ }
    func didReceiveAccess(){ }
    func didRejectAccess(){ }
}

class CameraAccessor: PermissionAccessor{
    var isAccessed = false
    
    override func hasAccess() -> Bool{
        return isAccessed
    }
    override func requestAccess(_ complition: @escaping Complition){
        print("Requesting access to Camera..")
        isAccessed = true
        complition(isAccessed)
    }
}

class LibraryAccessor: PermissionAccessor{
    var isAccessed = false
    
    override func hasAccess() -> Bool{
        return isAccessed
    }
    override func requestAccess(_ complition: @escaping Complition){
        print("Requesting access to PhotoLibrary..")
        complition(isAccessed)
    }
}

let accessor = CameraAccessor()
func request(){
    accessor.requestAccessIfNeed({status in
        status ? print("Access is received") : print("Access is rejected")
    })
}

request()
request()

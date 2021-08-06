
protocol Transport {
    func deliver(from: String, to: String)
}
class Ship: Transport{
    func deliver(from source: String, to destination: String){
        print("Deliver on SHIP from \(source) to \(destination)")
    }
}
class Truck: Transport{
    func deliver(from source: String, to destination: String){
        print("Deliver on TRUCK from \(source) to \(destination)")
    }
}

protocol TransportCompany{
    var companyAdress : String { get }
    func createTransport() -> Transport
    func deliverBox(to destinationAdress: String)
}
extension TransportCompany{
    func deliverBox(to destinationAdress: String){
        let transport = createTransport()
        transport.deliver(from: companyAdress, to: destinationAdress)
    }
}
class ShipTransportCompany: TransportCompany{
    var companyAdress = "Company address"
    func createTransport() -> Transport{
        return Ship()
    }
}
class TruckTransportCompany: TransportCompany{
    var companyAdress = "Company address"
    func createTransport() -> Transport{
        return Truck()
    }
}

func main(){
    let firstCompany = TruckTransportCompany()
    firstCompany.deliverBox(to: "Nsk")
    
    let secondCompany = ShipTransportCompany()
    secondCompany.deliverBox(to: "Msk")
}

main()

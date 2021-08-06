//
//  NetwokingService.swift
//  First-MVC
//
//  Created by Артём on 14.07.2021.
//

import Foundation

class NetworkingService{
    
    private init() {}
    static let shared = NetworkingService()
    
    func loadData(from url: URL, complition: @escaping (Any) -> Void){
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, responce, error) in
            guard let data = data else { return }
            do{
                let parsedData = try JSONSerialization.jsonObject(with: data, options: [])
                DispatchQueue.main.async {
                    complition(parsedData)
                }
            } catch let parseError{
                print(parseError)
            }
        }.resume()
    }
}

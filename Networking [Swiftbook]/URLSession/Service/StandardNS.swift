//
//  File.swift
//  URLSession
//
//  Created by Артём on 25.07.2021.
//

import UIKit

class StandardNetworkService: NetworkService{
    
    static func downloadImage(url: URL, completion: @escaping (UIImage)->()){
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, _, error in
            guard
                let data = data,
                let image = UIImage(data: data)
            else {
                print(error?.localizedDescription ?? "No error")
                return
            }
            completion(image)
        }
        task.resume()
    }
    
    static func GETRequest(completion: @escaping (Any)->()){
        guard let url = URL(string: URLConstants.testApi) else {
            print("No correct url")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data,
                let response = response as? HTTPURLResponse
            else {
                print("No correct response")
                return
            }
            print("Response for GET REQUEST: \(response.statusCode)")
            
            do {
                let serialisedData = try JSONSerialization.jsonObject(with: data, options: [])
                completion(serialisedData)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    
    static func POSTRequest(completion: @escaping (HTTPURLResponse)->()){
        guard let url = URL(string: URLConstants.testApi) else { return }
        var request = URLRequest(url: url)
        request.addValue("Simple network App", forHTTPHeaderField: "User-agent")
        request.httpMethod = "POST"
        
        do{
            let body = [
                "title" : "New super duper post!",
                "text" : "Hello, world, how are you today?"
            ]
            let bodyData = try JSONSerialization.data(withJSONObject: body, options: [])
            request.httpBody = bodyData
        }catch{
            print(error)
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse else { return }
            completion(response)
        }.resume()
    }
    
    static func fetchData(completion: @escaping ([Course])->()){
        guard let url = URL(string: URLConstants.swiftbookApi) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            do{
                let courses = try JSONDecoder().decode([Course].self, from: data)
                completion(courses)
            } catch let error{
                print("Json decoding error", error)
            }
        }.resume()
    }
    
    static func uploadImage(completion: @escaping (String)->() ){
        guard let destinationUrl = URL(string: URLConstants.imgurApi) else { return }
        var request = URLRequest(url: destinationUrl)
        request.httpMethod = "POST"
        
        let headers = ["Authorization": "Client-ID 00a8c3c76ce585c"]
        request.allHTTPHeaderFields = headers
        
        guard let image = UIImage(named: "OceanPhoto") else { return }
        request.httpBody = image.jpegData(compressionQuality: CGFloat(100))
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let response = response as? HTTPURLResponse else { return }
            guard
                response.statusCode == 200,
                let data = data
            else {
                print("Something goes wrong: \(response.statusCode)")
                return
            }
            
            do{
                let response = try JSONDecoder().decode(ImgurUploadResponse.self, from: data)
                completion(response.data.link)
            } catch let decodingError{
                print("Decoding error: \(decodingError)")
            }
        }.resume()
    }
}

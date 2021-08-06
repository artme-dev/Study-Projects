//
//  AlamofireNS.swift
//  URLSession
//
//  Created by Артём on 30.07.2021.
//

import UIKit
import Alamofire

class AlamofireNetworkService: NetworkService{
    static func downloadImage(url: URL, completion: @escaping (UIImage) -> ()) {
        
        AF.request(url).validate().responseData { response in
            switch response.result{
            case .success(let data):
                guard let image = UIImage(data: data) else { return }
                completion(image)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    static func GETRequest(completion: @escaping (Any) -> ()) {
        
        AF.request(URLConstants.testApi)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .response { response in
                
                print("Status code: \(String(describing: response.response?.statusCode))")
                print("Header: \(String(describing: response.response?.allHeaderFields))")
                
                guard let data = response.data else { return }
                let decoder = JSONDecoder()
                do {
                    let posts = try decoder.decode([Post].self, from: data)
                    dump(posts)
                } catch let decodingError{
                    print("Decoding error: \(decodingError)")
                }
            }
        
    }
    
    static func POSTRequest(completion: @escaping (HTTPURLResponse) -> ()) {
        
        let headers = HTTPHeaders([
            HTTPHeader(name: "Super", value: "Duper"),
            HTTPHeader(name: "Nano", value: "Power"),
        ])
        
        let postData: [String : Any] = [
            "name": "John",
            "age": 32
        ]
        
        AF.request(URLConstants.testApi,
                   method: .post,
                   parameters: postData,
                   headers: headers)
            .responseString { response in
                switch response.result{
                case .success(let stringData):
                    print(stringData)
                case .failure(let error):
                    print("Error:\(error)")
                }
            }
    }
    
    static func fetchData(completion: @escaping ([Course]) -> ()) {
    
        AF.request(URLConstants.swiftbookApi).validate().responseJSON { response in
            switch response.result{
            case .success(let values):
                guard let values = values as? Array<[String: Any]> else { return }
                
                var courses = [Course]()
                for value in values{
                    courses.append(Course(from: value))
                }
                
                completion(courses)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static func easyFetchData(completion: @escaping ([Course]) -> ()) {
        AF.request(URLConstants.swiftbookApi).validate().responseDecodable {
            (response: DataResponse<[Course], AFError>) in
            
            switch response.result{
            case .success(let courses):
                completion(courses)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    static func uploadImage(completion: @escaping (String) -> ()) {
        
        guard
            let image = UIImage(named: "OceanPhoto"),
            let imageData = image.jpegData(compressionQuality: CGFloat(100))
        else { return }
        
        let upload = AF.upload(imageData,
                               to: URLConstants.imgurApi,
                               headers: [HTTPHeader(name: "Authorization", value: "Client-ID 00a8c3c76ce585c")])
        
        
        upload.validate().responseDecodable(of: ImgurUploadResponse.self) {
            response in            
            switch response.result{
            case .success(let imgurResponse):
                completion(imgurResponse.data.link)
                print(response.debugDescription)
            case .failure(let error):
                print("Error: \(error)")
                print(response.debugDescription)
            }
        }
    }
    
    
}

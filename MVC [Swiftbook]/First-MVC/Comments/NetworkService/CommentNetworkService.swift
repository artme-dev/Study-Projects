//
//  CommentNetworkService.swift
//  First-MVC
//
//  Created by Артём on 14.07.2021.
//

import Foundation

class CommentNetworkService{
    private init() {}
    
    static let targetURL = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments")
    
    static func loadComments(complition: @escaping (GetCommentsResponce)->()){
        guard let url = targetURL else { return }
        
        let service = NetworkingService.shared
        service.loadData(from: url) { data in
            do{
                let response = try GetCommentsResponce(from: data)
                complition(response)
            } catch{
                print("Error =)")
            }
        }
    }
}

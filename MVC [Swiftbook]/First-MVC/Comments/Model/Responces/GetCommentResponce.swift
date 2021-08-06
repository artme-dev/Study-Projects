//
//  File.swift
//  First-MVC
//
//  Created by Артём on 14.07.2021.
//

import Foundation

class GetCommentsResponce{
    typealias JSON = [String: AnyObject]
    var comments : [Comment]

    init(from jsonData: Any) throws{
        comments = [Comment]()
        
        guard let data = jsonData as? [JSON] else { throw NetworkError.SmtGoWrong }
        
        for element in data{
            if let comment = Comment(from: element){
                comments.append(comment)
            }
        }
    }
}

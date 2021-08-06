//
//  Course.swift
//  URLSession
//
//  Created by Артём on 25.07.2021.
//

import Foundation

struct Course: Codable{
    var id: Int?
    var name: String?
    var link: String?
    var imageUrl: String?
    var numberOfLessons: Int?
    var numberOfTests: Int?
    
    enum CoursesCodingKey: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case link = "Link"
        case imageUrl = "ImageUrl"
        case numberOfLessons = "Number_of_lessons"
        case numberOfTests = "Number_of_tests"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CoursesCodingKey.self)
        self.id = try container.decode(Int?.self, forKey: .id)
        self.name = try container.decode(String?.self, forKey: .name)
        self.link = try container.decode(String?.self, forKey: .link)
        self.imageUrl = try container.decode(String?.self, forKey: .imageUrl)
        self.numberOfLessons = try container.decode(Int?.self, forKey: .numberOfLessons)
        self.numberOfTests = try container.decode(Int?.self, forKey: .numberOfTests)
    }
    
    init(from jsonArray: [String: Any]) {
        let id = jsonArray["Id"] as? Int
        let name = jsonArray["Name"] as? String
        let link = jsonArray["Link"] as? String
        let imageUrl = jsonArray["ImageUrl"] as? String
        let numberOfLessons = jsonArray["Number_of_lessons"] as? Int
        let numberOfTests = jsonArray["Number_of_tests"] as? Int
        
        self.id = id
        self.name = name
        self.link = link
        self.imageUrl = imageUrl
        self.numberOfLessons = numberOfLessons
        self.numberOfTests = numberOfTests
    }
}

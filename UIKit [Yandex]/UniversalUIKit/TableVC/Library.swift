//
//  File.swift
//  UniversalUIKit
//
//  Created by Артём on 16.07.2021.
//

import Foundation

struct Content {
    var title: String
    var text: String
}

class Library{
    private init(){}
    
    static let typeContentCount = 2
    static var content: [[Content]] {
        return [posts, songs, DinamicLabrary.elements]
    }
    
    static let posts: [Content] = {
        var posts = [Content]()
        for i in 1..<10{
            var numeratedPost = Content(title: "Title\(i)",
                                     text: "Hello, today I want to be on the post number \(i)")
            posts.append(numeratedPost)
        }
        return posts
    }()
    
    static let songs: [Content] = {
        var songs = [Content]()
        for i in 1..<10{
            var numeratedSong = Content(title: "Author #\(i)",
                                     text: "Song #\(i)")
            songs.append(numeratedSong)
        }
        return songs
    }()
    
}

class DinamicLabrary{
    private init(){}
    static var elements = [Content]()
    
    private static var startIndex = 0
    private static var endIndex = 0
    
    static func getElement(at index: Int) -> Content{
        return elements[index]
    }
    
    static func generateElements(){
        startIndex -= 1
        endIndex += 1
        let startElement = createNewElement(for: startIndex)
        let endElement = createNewElement(for: endIndex)
        
        elements.insert(startElement, at: 0)
        elements.append(endElement)

    }
    
    private static func createNewElement(for index: Int) -> Content{
        return Content(title: "Super Title #\(index)", text: "And very simple description")
    }
}

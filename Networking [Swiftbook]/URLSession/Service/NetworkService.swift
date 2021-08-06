//
//  NetworkService.swift
//  URLSession
//
//  Created by Артём on 30.07.2021.
//

import Foundation
import UIKit

protocol NetworkService{
    
    static func downloadImage(url: URL, completion: @escaping (UIImage)->())
    
    static func GETRequest(completion: @escaping (Any)->())
    
    static func POSTRequest(completion: @escaping (HTTPURLResponse)->())
    
    static func fetchData(completion: @escaping ([Course])->())
    
    static func uploadImage(completion: @escaping (String)->())
}



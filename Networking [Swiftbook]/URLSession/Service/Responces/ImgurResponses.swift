//
//  File.swift
//  URLSession
//
//  Created by Артём on 27.07.2021.
//

import Foundation

struct ImgurUploadResponse: Codable{
    var status: Int
    var success: Bool
    var data: ImgurData
}

struct ImgurData: Codable {
    var link: String
    var height: Int
    var width: Int
    var size: Int
}

//
//  ChapterResponse.swift
//  Elshamel
//
//  Created by mohamed rafik on 08/05/2023.
//

import Foundation

class ChapterResponse: Codable {
    var data: ChapterData?
    var message: String?
    var errors: [String:[String]]?
}

class ChapterData: Codable {
    var id: Int?
    var name: String?
    var videos: [Videos]
    var pdfs: [Pdfs]
    var exams: [Exams]
}

class Pdfs: Codable {
    var id: Int?
    var name: String?
    var file: String?
    var is_free: Bool?
    var classs: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case file = "file"
        case is_free = "is_free"
        case classs = "class"
    }
}

class Videos: Codable {
    var id: Int?
    var name: String?
    var file: String?
    var is_free: Bool?
    var classs: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case file = "file"
        case is_free = "is_free"
        case classs = "class"
    }
}

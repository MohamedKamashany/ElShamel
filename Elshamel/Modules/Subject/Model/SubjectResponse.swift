//
//  SubjectResponse.swift
//  Elshamel
//
//  Created by mohamed rafik on 06/05/2023.
//

import Foundation

class SubjectResponse: Codable {
    var data: SubjectData?
    var message: String?
    var errors: [String:[String]]?
}

class SubjectData: Codable {
    var id: Int?
    var material: Material?
    var grade: Grade?
    var semester: String?
    var semester_label: String?
    var parts: [Parts]
}

class Parts: Codable {
    var id: Int?
    var name: String?
    var chapters: [Chapters]
}

class Chapters: Codable {
    var id: Int?
    var name: String?
}

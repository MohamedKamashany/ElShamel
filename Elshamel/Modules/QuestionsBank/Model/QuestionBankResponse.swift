//
//  QuestionBankResponse.swift
//  Elshamel
//
//  Created by mohamed rafik on 19/04/2023.
//

import Foundation



class QuestionBankResponse: Codable {
    var data: Exams?
    var message: String?
    var errors: [String:[String]]?
}


class Exams: Codable {
    var id: Int?
    var name: String?
    var type: String?
    var type_label: String?
    var duration: Int?
    var is_taken: Bool?
    var is_submitted: Bool?
    var score: Int?
    var is_free: Bool?
    var classs: String?
    var questions: [Questions]?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case type = "type"
        case type_label = "type_label"
        case duration = "duration"
        case is_taken = "is_taken"
        case is_submitted = "is_submitted"
        case score = "score"
        case is_free = "is_free"
        case classs = "class"
        case questions = "questions"
    }
}

class Questions: Codable {
    var id: Int?
    var title: String?
    var body: String?
    var image: String?
    var answers: [Answers]?
}

class Answers: Codable {
    var id: Int?
    var body: String?
    var image: String?
    var is_correct: Bool?
    var is_selected: Bool?
}

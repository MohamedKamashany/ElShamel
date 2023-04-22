//
//  QuestionBankResponse.swift
//  Elshamel
//
//  Created by mohamed rafik on 19/04/2023.
//

import Foundation



class QuestionBankResponse: Codable {
    var data: QuestionBankData?
    var message: String?
    var errors: [String:[String]]?
}

class QuestionBankData: Codable {
    var items: [ExamItem]?
    var has_more_pages: Bool?
    var current_page: Int?
    var last_page: Int?
}


class ExamItem: Codable {
    var id: Int?
    var student_id: Int?
    var exam_id: Int?
    var started_at: String?
    var finished_at: String?
    var is_finished: Bool?
    var is_submitted: Bool?
    var token: String?
    var score: Int?
    var exam: Exams?
//    var answers: []
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
}

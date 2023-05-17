//
//  StartExamResponse.swift
//  Elshamel
//
//  Created by mohamed rafik on 19/04/2023.
//

import Foundation


class StartExamResponse: Codable {
    var data: StartExamData?
    var message: String?
    var errors: [String:[String]]?
}

class StartExamData: Codable {
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
    var answers: [Answers]?
}

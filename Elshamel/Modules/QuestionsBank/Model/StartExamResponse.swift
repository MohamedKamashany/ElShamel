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
    var exam: Exam?
    //    var answers: []?
}


class Exam: Codable {
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

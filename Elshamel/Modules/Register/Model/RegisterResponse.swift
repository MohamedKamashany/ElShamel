//
//  RegisterResponse.swift
//  Elshamel
//
//  Created by mohamed rafik on 05/04/2023.
//

import Foundation

class RegisterResponse: Codable {
    var data: RegisterData?
    var message: String?
//    var errors: AnyObject?
}

class RegisterData: Codable {
    var account: RegisterStudentAccount?
    var token: String?
}

class RegisterTeacherAccount: Codable {
    var id: Int?
    var name: String?
    var email: String?
    var phone: String?
    var gender: String?
    var material_id: Int?
    var is_verified: Bool?
    var class_name: String?
    var login_method: String?
    var verification_code: String?
}

class RegisterStudentAccount: Codable {
    var id: Int?
    var name: String?
    var email: String?
    var phone: String?
    var gender: String?
    var grade_id: Int?
    var is_verified: Bool?
    var class_name: String?
    var login_method: String?
    var verification_code: String?
    var student_exams_avg_score: String?
    var is_clever: Bool?
}

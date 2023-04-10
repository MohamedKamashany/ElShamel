//
//  LoginResponse.swift
//  Elshamel
//
//  Created by Mahmoud ELDemery on 26/02/2023.
//

import Foundation

class LoginResponse: Codable {
    var data: User?
    var message: String?
    //var errors: AnyObject?
}

class User: Codable {
    var account: UserAccount?
    var token: String?
}

class UserAccount: Codable {
    var id: String?
    var name: String?
    var email: String?
    var phone: String?
    var gender: String?
    var grade_id: Int?
    var grade: UserGrade?
    var is_verified: Bool?
    //var plans: Any?
    var class_name: String?
    var login_method: String?
    var verification_code: String?
    var student_exams_avg_score: String?
    var is_clever: Bool?
}

class UserGrade: Codable {
    var id: Int?
    var name: String?
}

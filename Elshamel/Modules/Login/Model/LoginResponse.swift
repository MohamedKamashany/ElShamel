//
//  LoginResponse.swift
//  Elshamel
//
//  Created by Mahmoud ELDemery on 26/02/2023.
//

import Foundation

//class LoginResponse: Codable {
//    var data: User?
//    var message: String?
//    //var errors: AnyObject?
//}
//
//class User: Codable {
//    var account: UserAccount?
//    var token: String?
//}
//
//class UserAccount: Codable {
//    var id: String?
//    var name: String?
//    var email: String?
//    var phone: String?
//    var gender: String?
//    var grade_id: Int?
//    var grade: UserGrade?
//    var is_verified: Bool?
//    //var plans: Any?
//    var class_name: String?
//    var login_method: String?
//    var verification_code: String?
//    var student_exams_avg_score: String?
//    var is_clever: Bool?
//}
//
//class UserGrade: Codable {
//    var id: Int?
//    var name: String?
//}


struct LoginResponse: Codable {
    let data: DataClass
    let message: String
    let errors: Errors
}

// MARK: - DataClass
struct DataClass: Codable {
    let account: Account
    let token: String
}

// MARK: - Account
struct Account: Codable {
    let id: Int
    let name, email, phone, gender: String
    let gradeID: Int
    let grade: Grade
    let isVerified: Bool
    //let plans: [JSONAny]
    let className, loginMethod, verificationCode: String
    //let studentExamsAvgScore: JSONNull?
    let isClever: Bool

    enum CodingKeys: String, CodingKey {
        case id, name, email, phone, gender
        case gradeID = "grade_id"
        case grade
        case isVerified = "is_verified"
        //case plans
        case className = "class_name"
        case loginMethod = "login_method"
        case verificationCode = "verification_code"
        //case studentExamsAvgScore = "student_exams_avg_score"
        case isClever = "is_clever"
    }
}

// MARK: - Errors
struct Errors: Codable {
}

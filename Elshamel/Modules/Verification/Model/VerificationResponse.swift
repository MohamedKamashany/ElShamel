//
//  VerificationResponse.swift
//  Elshamel
//
//  Created by mohamed rafik on 17/04/2023.
//

import Foundation



class VerificationResponse: Codable {
    var data: VerificationData?
    var message: String?
    var errors: [String:[String]]?
}

class VerificationData: Codable {
    var account: VerificationAccount?
    var token: String?
}

class VerificationAccount: Codable {
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

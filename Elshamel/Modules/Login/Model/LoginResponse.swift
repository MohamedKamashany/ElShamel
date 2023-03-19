//
//  LoginResponse.swift
//  Elshamel
//
//  Created by Mahmoud ELDemery on 26/02/2023.
//

import Foundation

class LoginResponse: Codable {
    let status:Bool?
    let errors:[String]?
    let isVerified:Bool?
    let data:[UserData]?
    
    enum CodingKeys: String, CodingKey {
        case status
        case errors
        case isVerified
        case data
    }
    
    init(status:Bool?, errors:[String]?, data:[UserData]?, isVerified:Bool?) {
        self.data = data
        self.status = status
        self.errors = errors
        self.isVerified = isVerified
    }
}

class LoginAcount: Codable {
    var data: AcountData?
    var message: String?
//    var errors: String?
}

class AcountData: Codable {
    var account: Account?
    var token: String?
}

class Account: Codable {
    var id: Int?
    var name: String?
    var email: String?
    var phone: String?
    var gender: String?
    var material_id: Int?
    var material: Material?
    var is_verified: Bool?
    var class_name: String?
    var login_method: String?
    var verification_code: String?
}

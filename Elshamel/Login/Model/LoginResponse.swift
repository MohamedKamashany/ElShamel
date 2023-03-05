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


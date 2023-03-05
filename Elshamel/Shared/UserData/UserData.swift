//
//  UserData.swift
//  Elshamel
//
//  Created by Mahmoud ELDemery on 05/03/2023.
//

import Foundation


class UserData: Codable {
    let accountId:String?
    let name:String?
    let mobile:String?
    let email:String?
    let gender:String?
    let position:String?
    let photo:String?
    let status:String?
    private var goalsCount:String?
    let verification_code:String?
    
    var is_followed:String?
    
    
    enum CodingKeys: String, CodingKey {
        case accountId = "account_id"
        case name = "name"
        case mobile = "mobile"
        case email = "email"
        case gender = "gender"
        case position = "position"
        case photo = "photo"
        case status = "status"
        case goalsCount = "goal_count_on_login"
        case verification_code = "verification_code"
        case is_followed = "is_followed"
    }
}



class LogedInUser {
    
    static let shared = LogedInUser()
    var userData:UserData? {
        get {
            return PersistentDataHelper.shared.userInfo
        }
        set {
            PersistentDataHelper.shared.userInfo = newValue
        }
    }
    var token:String? {
        get {
            return PersistentDataHelper.shared.token
        }
        set {
            PersistentDataHelper.shared.token = newValue
        }
    }

    private init() {}
    
    static func delete() {
        PersistentDataHelper.shared.removeAll()
        shared.userData = nil
        shared.token = nil
    }
}


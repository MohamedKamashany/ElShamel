//
//  AppData.swift
//  Elshamel
//
//  Created by mohamed rafik on 03/05/2023.
//

import Foundation

class AppData {
    
    static let shared = AppData()
    
    var grades: [Grade]?
    var materials: [Material]?
    var semesters: Semesters?
//    var appData:Account? {
//        get {
//            return PersistentDataHelper.shared.userInfo
//        }
//        set {
//            PersistentDataHelper.shared.userInfo = newValue
//        }
//    }
    
//    var token:String? {
//        get {
//            return PersistentDataHelper.shared.token
//        }
//        set {
//            PersistentDataHelper.shared.token = newValue
//        }
//    }

    private init() {}
    
    static func delete() {
        PersistentDataHelper.shared.removeAll()
//        shared.appData = nil
//        shared.token = nil
    }
}


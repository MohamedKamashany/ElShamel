//
//  PersistentDataHelper.swift
//  Akoon
//
//  Created by M.Ibrahim on 9/11/20.
//  Copyright © 2020 M.Ibrahim. All rights reserved.
//

import Foundation
//import SwiftKeychainWrapper

class PersistentDataHelper {
    
    static let shared = PersistentDataHelper()
    private init() {}

    func removeAll() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
        UserDefaults.standard.synchronize()
    }

    // MARK: - token

    var token: String? {
        get {
            return UserDefaults.standard.value(forKey: keychainWrapperKeys.token.rawValue) as? String
        }
        set {
            if let value = newValue {
                UserDefaults.standard.set(value, forKey: keychainWrapperKeys.token.rawValue)
            }
        }
    }

    // MARK: - userInfo

    var userInfo: Account? {
        get {
            if let savedPerson = UserDefaults.standard.value(forKey: keychainWrapperKeys.user.rawValue) as? Data {
                let decoder = JSONDecoder()
                do {
                    return try decoder.decode(Account.self, from: savedPerson)
                } catch  {
                    return nil
                }
            } else {
                return nil
            }
        }
        set {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(newValue) {
                UserDefaults.standard.set(encoded, forKey: keychainWrapperKeys.user.rawValue)
//                NotificationCenter.default.post(name: NSNotification.Name("userInfo"), object: nil)
            }
        }
    }
}

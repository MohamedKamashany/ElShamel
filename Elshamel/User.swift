//
//  User.swift
//  Elshamel
//
//  Created by mohamed rafik on 17/01/2023.
//

import Foundation

// Singleton Class (Create only one object from the class)
class User {
    
    var name:String?
    var age:Int?
    
    private static var instance: User?
    
    
    private init() {}
    
    private init(name:String) {
        self.name = name
    }
    
    // 1
    static var standard: User {
        get {
            if let instance = instance {
                return instance
            }
            
            instance = User()
            return instance!
        }
    }
    
    // 2
    static var sharedObj: User = {
        if let instance = instance {
            return instance
        }
        
        instance = User()
        return instance!
    }()
    
    // 3
    static func shared() -> User {
        if let instance = instance {
            return instance
        }
        
        instance = User()
        return instance!
    }
    
}

//
//  NetworkErrorType.swift
//  AlFatiha
//
//  Created by fares elsokary on 8/3/20.
//  Copyright © 2020 fares elsokary. All rights reserved.
//

import Foundation

enum ElShamelErrorType: Error {

    case noInternet
    case uploadImageError
    case uploadError
    case couldNotParseJson
    case serverError
    case validationError
    case unauthenticated
    case couldNotEncodeBodyToJSON
    
    func getMessage() -> String {
        switch self {
        case .noInternet:
            return "لا يوجد انترنت "
        case .unauthenticated:
            return "المستخدم غير مسجل من قبل"
        default:
            return "يوجد خطأ برجاء المحاولة بعد قليل"
        }
    }
}

struct NetWorkError: Error {
    var errorType: ElShamelErrorType?
    
    
}

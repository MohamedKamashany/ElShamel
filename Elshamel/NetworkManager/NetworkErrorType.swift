//
//  NetworkErrorType.swift
//  AlFatiha
//
//  Created by fares elsokary on 8/3/20.
//  Copyright © 2020 fares elsokary. All rights reserved.
//

import Foundation

enum NetworkErrorType {
    case noInternet
    case uploadImageError
    case uploadError
    case couldNotParseJson
    case serverError
    case validationError
    case unauthenticated
    case couldNotEncodeBodyToJSON
}

struct NetWorkError: Error {
    var errorType: NetworkErrorType?
}

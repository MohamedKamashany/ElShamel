//
//  ResetPasswordResponse.swift
//  Elshamel
//
//  Created by mohamed rafik on 01/05/2023.
//

import Foundation


class ResetPasswordResponse: Codable {
    var data: Int?
    var message: String?
    var errors: [String:[String]]?
}

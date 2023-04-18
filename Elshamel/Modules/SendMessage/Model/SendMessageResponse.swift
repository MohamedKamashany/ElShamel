//
//  SendMessageResponse.swift
//  Elshamel
//
//  Created by mohamed rafik on 18/04/2023.
//

import Foundation


class SendMessageResponse: Codable {
    var data: SendMessageData?
    var message: String?
    var errors: [String:[String]]?
}

class SendMessageData: Codable {
    var title: String?
    var body: String?
    var sender_id: Int?
    var sender_type: String?
    var updated_at: String?
    var created_at: String?
    var id: Int?
}

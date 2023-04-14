//
//  SubscriptionResponse.swift
//  Elshamel
//
//  Created by mohamed rafik on 10/04/2023.
//

import Foundation

struct SubscriptionResponse: Codable {
    var data: Plans?
    var message: String?
    //var errors: AnyObject?
}

struct Plans: Codable {
    var plans: [PlansData]?
}

struct PlansData: Codable {
    var id: Int?
    var name: String?
    var description: String?
    var price: Int?
    var duration: Int?
    var duration_type: String?
    var pdfs_price: Int?
    var videos_price: Int?
    var exams_price: Int?
    var plan_options: [String]?
}

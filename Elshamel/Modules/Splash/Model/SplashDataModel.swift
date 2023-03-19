//
//  SplashDataModel.swift
//  Elshamel
//
//  Created by mohamed rafik on 17/03/2023.
//

import Foundation

class SplashModel: Codable {
    var data: SplashData?
    var message: String?
    var errors: AnyObject?
}

class SplashData: Codable {
    
    var settings: Settings?
    var grades:  Grades?
    var materials:  Materials?
    var latest_videos: LatestVideos?
    var semesters: Semesters?
}


class Settings: Codable {
    var whatsapp: String?
    var phone: String?
    var email: String?
}

class Grades: Codable {
    var gradesList: [Grade]?
}

class Grade: Codable {
    var id: Int?
    var name: String?
}

class Materials: Codable {
    var materialsList: [Material]?
}

class Material: Codable {
    var id: Int?
    var name: String?
    var image: String?
}

class LatestVideos: Codable {
    var videoList: [Video]?
}

class Video: Codable {
    var id: Int?
    var name: String?
    var file: String?
    var is_free: Bool?
}

class Semesters: Codable {
    var first_semester: String?
    var second_semester: String?
}





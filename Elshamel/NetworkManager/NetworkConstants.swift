//
//  NetworkConstants.swift
//  SelfService
//
//  Created by Imac on 7/9/20.
//  Copyright © 2020 IbnSinai. All rights reserved.
//

import Foundation

class Headers {
    // MARK: - header

//    static var defaultHeader: [String: String] {
//        return [
//            "Authorization": "Bearer " + PersistentDataHelper.shared.token,
//        ]
//    }
}

enum EndPointUrls: String {

    case getSplashData = "splash/"
    
    case generateToken = "generate_token/"
    case login = "auth/login"
    case register = "teacher/auth/register"
    case verify = "teacher/auth/verify"
    case forgetPassword = "auth/reset-password-code"
    case plans = "student/plans"
    case sendMessage = "messages"
    case examsStart = "student/exams/start"
    case getExams = "student/exams/student-exams"
}

class BasUrls {
    static var domain = "http://elshamel.site"
    static var base = BasUrls.domain + "/api/"
}

enum NetWorkParameters: String {
    case username
    case password
}

enum keychainWrapperKeys: String {
    case token
    case fcmToken
    case uuid = "DeviceId"
    case user = "user_data"
    case KPITutorial
    case actionTutorial
}


enum NotificationCenterKeys: String {
    case newAction = "newAction"
    case newKPI = "newKPI"
    case newGoal = "newGoal"
    case reloadGoals = "reloadGoals"
    case newNote = "newNote"
    case deleteNote = "deleteNote"
    case updateAction = "updateAction"
    case newPost = "newPost"
    case editPost = "editPost"
    case logout = "logout"
}

enum fontName:String {
    case SFProDisplayBold = "SFProDisplay-Bold"
    case SFProDisplayMedium = "SFProDisplay-Medium"
}

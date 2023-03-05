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
    case generateToken = "generate_token/"
    case login = "v1/login/"
    case register = "v1/accounts/"
    case verify = "v1/account/validate_email/"
    case forgetPassword = "v1/account/reset_password/"
    case changeForgettenPassword = "v1/account/change_password/"
    case goals = "v1/goals/"
    case goalCategories = "v1/categories/"
    case goalCategoryTemplates = "v1/goal_templates/"
    case actions = "v1/actions/"
    case KPIs = "v1/kpis/"
    case KPIProgress = "v1/kpi/progress/"
    case KPI_Templates = "v1/kpi_templates/"
    case notes = "v1/notes/"
    case overall = "v1/dashboard/"
    case posts = "v1/posts/"
    case follow = "v1/followers/"
    case reportUser = "v1/account/reports/"
    case reportPost = "v1/post/reports/"
    case like = "v1/post/likes/"
    case comment = "v1/post/comments/"
    case notifications = "v1/notifications/"
}

class BasUrls {
    static var domain = "https://akooon.sieraj.com/akooon/api/akooon"
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

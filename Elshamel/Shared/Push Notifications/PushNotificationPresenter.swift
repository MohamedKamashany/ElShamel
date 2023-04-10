//
//  PushNotificationPresenter.swift
//  Akoon
//
//  Created by Mahmoud ELDemery on 06/06/2022.
//  Copyright © 2022 M.Ibrahim. All rights reserved.
//

import Foundation
import UIKit

enum PushNotificationsUserDefaultKey: String {
    case authorized = "isPushNotificationaAuthorized"
    case cachedInBackend = "isPushNotificationSentToBackend"
    case askedForAuthorization = "isAskedForPushNotificationPersmission"
    case token = "PushNotificationToken"
}

class PushNotificationsPresenter {
    
    func checkPushNotification() {
        if !isAskedForPermissionOnce() && !isAuthorized() {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.registerForRemoteNotification()
        }else if !isTokenSentToBackend() {
            if let token = getToken() {
                send(token: token)
            }
        }
    }
    
    func send(token:String) {
        var bodyParams = [String:String]()
        bodyParams["fcm_token"] = token
        
//        if NetworkManager.shared.isInternetAvailable() {
//            NetworkManager.shared.processReq(url: .register, method: .put, bodyParams: bodyParams, returnType: LoginResponse.self, completionHandler: { [weak self] (result) in
//                switch result {
//                case let .success(response):
//                    if let errors = response?.errors, errors.count > 0 {
//                        self?.saveTokenSentToBackend(isSaved: false)
//                    } else {
//                        if let responseData = response?.data, responseData.count > 0 {
//                            self?.saveTokenSentToBackend(isSaved: true)
//                        }else{
//                            self?.saveTokenSentToBackend(isSaved: false)
//                        }
//                    }
//                case .failure:
//                    self?.saveTokenSentToBackend(isSaved: false)
//                }
//            })
//        }
    }
    
    // MARK: - is user Granted Push notification permission
    func setAuthorized(isAuthorized:Bool) {
        UserDefaults.standard.set(isAuthorized, forKey: PushNotificationsUserDefaultKey.authorized.rawValue)
    }
    
    func isAuthorized() -> Bool {
        return UserDefaults.standard.bool(forKey: PushNotificationsUserDefaultKey.authorized.rawValue)
    }
    
    // MARK: - is token cached in backend
    func saveTokenSentToBackend(isSaved:Bool) {
        UserDefaults.standard.set(isSaved, forKey: PushNotificationsUserDefaultKey.cachedInBackend.rawValue)
    }
    
    func isTokenSentToBackend() -> Bool {
        return UserDefaults.standard.bool(forKey: PushNotificationsUserDefaultKey.cachedInBackend.rawValue)
    }
    
    // MARK: - Asking for push notification permission
    /*  when logging for the first time after installing the app */
    func saveAskingForPermissionOnce(isSaved:Bool) {
        UserDefaults.standard.set(isSaved, forKey: PushNotificationsUserDefaultKey.askedForAuthorization.rawValue)
    }
    
    func isAskedForPermissionOnce() -> Bool {
        return UserDefaults.standard.bool(forKey: PushNotificationsUserDefaultKey.askedForAuthorization.rawValue)
    }
    
    
    // MARK: - push notification token
    func getToken() -> String? {
       return  UserDefaults.standard.string(forKey: PushNotificationsUserDefaultKey.token.rawValue)
    }
    
    func setToken(_ token:String) {
        UserDefaults.standard.set(token, forKey: PushNotificationsUserDefaultKey.token.rawValue)
    }
}

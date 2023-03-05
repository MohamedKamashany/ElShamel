//
//  AppDelegate.swift
//  Elshamel
//
//  Created by mohamed rafik on 28/12/2022.
//

import UIKit
import Firebase
import FirebaseMessaging

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}


extension AppDelegate: MessagingDelegate {
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
        //        let token = tokenParts.joined()
        if let token = Messaging.messaging().fcmToken {
            print("Device Token: \(token)")
            PushNotificationsPresenter().setToken(token)
            PushNotificationsPresenter().send(token: token)
        }
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register: \(error)")
        PushNotificationsPresenter().setAuthorized(isAuthorized: false)
    }
    
    
    func registerForRemoteNotification() {
        if #available(iOS 10.0, *) {
            PushNotificationsPresenter().saveAskingForPermissionOnce(isSaved: true)
            let center  = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.sound, .alert, .badge]) { (granted, error) in
                guard granted else {
                    PushNotificationsPresenter().setAuthorized(isAuthorized: false)
                    return
                }
                DispatchQueue.main.async {
                    PushNotificationsPresenter().setAuthorized(isAuthorized: true)
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
        else {
            PushNotificationsPresenter().saveAskingForPermissionOnce(isSaved: true)
            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.sound, .alert, .badge], categories: nil))
            UIApplication.shared.registerForRemoteNotifications()
            PushNotificationsPresenter().setAuthorized(isAuthorized: true)
        }
    }
    
    private func configFirebase() {
        FirebaseApp.configure()
        UNUserNotificationCenter.current().delegate = self
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        handleNotificationBody(userInfo: notification.request.content.userInfo)
        completionHandler([.sound, .badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        handleNotificationBody(userInfo: response.notification.request.content.userInfo)
        completionHandler()
    }
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        handleNotificationBody(userInfo: userInfo)
        
    }
    
    func handleNotificationBody(userInfo: [AnyHashable : Any]) {
        if let type = userInfo[""] as? String , type == "" {
            // redirect to telawa screen and auto refresh the telawa list by calling the service again
            
        }
    }
}



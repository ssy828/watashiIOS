//
//  AppDelegate.swift
//  RemoteNoti

import UIKit
import UserNotifications // 줄임말: un / ios 10부터 나옴

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        requestNotification()
        return true
    }
    
    // 사용자에게 알림에 대한 권한
    private func requestNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) { (grant, error) in
            // grant: 사용자가 허용했는지
            print("Grant:", grant , "Error:", error)
            DispatchQueue.main.async {
               UIApplication.shared.registerForRemoteNotifications()
            }
            
            UNUserNotificationCenter.current().delegate = self
            
            let action = UNNotificationAction(
                identifier: "action",
                title: "확인",
                options: UNNotificationActionOptions.destructive)
            
            let action2 = UNTextInputNotificationAction(
                identifier: "action2",
                title: "텍스트전송",
                options: UNNotificationActionOptions.foreground)
            
            let category = UNNotificationCategory(
                identifier: "category1",
                actions: [action, action2],
                intentIdentifiers: [],
                options: UNNotificationCategoryOptions.customDismissAction)
            
            UNUserNotificationCenter
                .current().setNotificationCategories([category])
        }
        // current 싱글턴
    }
    
    // noti 성공했을 경우
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // 토큰을 문자열로 바꿈
        let tokenParts = deviceToken.map { data -> String in
            return String(format: "%02.2hhx", data)
        }
        let token = tokenParts.joined()
        print("Device Token is :", token)
        
    }
    
    // 실패했을 경우
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.badge,.sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        // 각각에 따라서 분기처리해 줄 것
        
        completionHandler()
    }
}

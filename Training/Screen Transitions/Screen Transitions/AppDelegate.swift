//
//  AppDelegate.swift
//  Screen Transitions
//
//  Created by SSY on 2018. 5. 11..
//  Copyright © 2018년 LittleMe. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        if #available(iOS 10.0, *){ // UserNotification 프레임 워크를 이용한 로컬 알림(ios 10 이상) -> ios 10 이상 버전은 if 조건절 실행
            // 알림 동의 여부 확인
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                if settings.authorizationStatus == UNAuthorizationStatus.authorized{
                    // 알림 콘텐츠 인스턴스
                    let nContent = UNMutableNotificationContent()
                    nContent.badge = 1
                    nContent.title = "로컬 알림 메시지"
                    nContent.subtitle = "다시 열어주세요~"
                    nContent.body = "왜 나갔어요! 다시 들와 주세요~"
                    nContent.sound = UNNotificationSound.default()
                    nContent.userInfo = ["name":"가나다"]
                    
                    // 알림 발송 조건 인스턴스
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                    
                    // 알림 요청 인스턴스
                    // 식별 아이디: 여러 개의 알림 요청 중에서 원하는 것을 식별하는 용도
                    let request = UNNotificationRequest(identifier: "일어나", content: nContent, trigger: trigger)
                    
                    // 노티피케이션 센터에 추가
                    UNUserNotificationCenter.current().add(request)
                } else{
                    print("사용자가 동의 하지 않음")
                }
            }
            
        }else{ // ios 9이하 UILocalNotification 이용
            
        }
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}


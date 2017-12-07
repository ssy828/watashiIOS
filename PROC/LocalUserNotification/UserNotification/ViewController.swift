//
//  ViewController.swift
//  UserNotification

import UIKit
import UserNotifications
// IOS 10부터 UserNotifications 프레임워크에서 local & remote 관리
class ViewController: UIViewController {
    @IBAction func buttonPress(_ sender: Any) {
        let content = UNMutableNotificationContent()
        content.title = "OMG"
        content.subtitle = "userNoti Test"
        content.body = "음악청취"
        content.badge = 1
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let request = UNNotificationRequest(identifier: "timer", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { didAllow, error in
            // Bool: 권한이 허용여부 확인
            // 허락시 : true가 didAllow로 들어가게 됨
        }
        UNUserNotificationCenter.current().delegate = self
    }

}
// MARK: UNUserNotificationCenterDelegate
extension ViewController : UNUserNotificationCenterDelegate {
    // 앱 안에 있을 때도 푸쉬알림을 받는 메소드
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.sound,.badge])
    }
}

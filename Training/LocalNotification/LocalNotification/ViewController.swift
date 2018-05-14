//
//  ViewController.swift
//  LocalNotification
//
//  Created by SSY on 2018. 5. 14..
//  Copyright © 2018년 LittleMe. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    // MARK: IBOutlet
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var msgTF: UITextField!
    // MARK: IBAction
    @IBAction func saveButton(_ sender: Any) {
        if #available(iOS 10.0, *){
            // UserNotification 프레임 워크 사용할 로컬 알림
            
            // 알림 동의 여부 확인
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                if settings.authorizationStatus == UNAuthorizationStatus.authorized{
                    // 알림 설정
                }else{
                    let alert = UIAlertController(title: "알림등록", message: "알림이 허용되지 않음", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "확인", style: .default)
                    alert.addAction(ok)
                    
                    self.present(alert, animated: false)
                    return
                }
            }
        }else{
            // LocalNotification 객체 사용한 로컬 알림
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}


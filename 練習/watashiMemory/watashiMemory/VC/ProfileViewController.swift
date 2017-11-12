//
//  ProfileViewController.swift
//  watashiMemory

import UIKit
// MARK: 로그인 기능 구현
class ProfileViewController: UIViewController {

    
    // MARK: 프로퍼티
    let userInfo = UserInfoManager() // 개인정보 관리자
    
    // MARK: Life of Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: 메소드
    func doLogin(_ sender: Any)
    {
        let loginAlert = UIAlertController(title: "Login", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        // 알림창에 들어갈 입력폼 추가
        loginAlert.addTextField { (tf) in
            tf.placeholder = "Account"
        }
        loginAlert.addTextField { (tf) in
            tf.placeholder = "Password"
            tf.isSecureTextEntry = true
        }
        
        // 알림창 버튼 추가
        loginAlert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel))
        loginAlert.addAction(UIAlertAction(title: "Login", style: UIAlertActionStyle.destructive) { (_) in
            let account = loginAlert.textFields?[0].text ?? ""
            let pwd = loginAlert.textFields?[1].text ?? ""
            
            // 로그인 성공시 처리할 내용 여기에 들어갈 예정
            if self.userInfo.login(account: account, pwd: pwd)
            {
                
            }else{
                let msg = "로그인에 실패!"
                let alert = UIAlertController(title: nil, message: msg, preferredStyle: UIAlertControllerStyle.alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel))
                self.present(alert, animated: false, completion: nil)
            }
        })
        self.present(loginAlert, animated: false, completion: nil)
    }
    
    // 로그아웃
    func doLogOut(_ sender: Any)
    {
        //
        let msg = "로그아웃 할까요?"
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "취소", style: UIAlertActionStyle.cancel))
        alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.destructive, handler: { (_) in
            if self.userInfo.logout(){
                // 로그아웃시 처리할 내용 여기에 들어감
            }
        }))
        self.present(alert, animated: false, completion: nil)
    }

}



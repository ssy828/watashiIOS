//
//  RegisterViewController.swift
//  MyMusicPlayer

//

import UIKit

class RegisterViewController: UIViewController {

    // MARK: UI프로퍼티
    @IBOutlet weak var lastNameTF: UITextField!
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var pwdTF: UITextField!
    
    @IBOutlet weak var birthDayTF: UITextField!
    @IBOutlet weak var repeatPwdTF: UITextField!
    
    @IBAction func gender(_ sender: UISegmentedControl) {
        
    }
    
    // MARK: 회원가입버튼 누를 경우
    @IBAction func signUpBtn(_ sender: RoundButton) {
        
        guard let userLastName = lastNameTF.text else { return }
        guard let userName = nameTF.text else { return }
        guard let userEmail = emailTF.text else { return }
        guard let userPwd = pwdTF.text else { return }
        guard let userRepeatPwd = repeatPwdTF.text else { return }
        guard let userBDay = birthDayTF.text else { return }
        
        // 이메일 / 비밀번호가 비어있는지 확인
        if userEmail.isEmpty || userPwd.isEmpty || userRepeatPwd.isEmpty
        {
            // 알림창 띄우기
            displayAlertMSG("아이디와 비밀번호는 필수입니다^^")
        }
        
        // 비밀번호끼리 맞는지 확인
        if userPwd != userRepeatPwd
        {
            displayAlertMSG("비밀번호가 틀렸습니다")
        }
        
        // 데이터 저장
        storeData(userEmail, forKey: "userEmail")
        storeData(userPwd, forKey: "userPwd")
        storeData(userName, forKey: "userName")
        storeData(userLastName, forKey: "userLastName")
        storeData(userRepeatPwd, forKey: "repeatPwd")
        storeData(userBDay, forKey: "userBDay")
        // ???
        UserDefaults.standard.synchronize()
        
        // 가입완료 알림창
        // 만든 함수를 이용해서 못할까?
        let registerAlert = UIAlertController(title: "알림", message: "가입을 축하합니다", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        registerAlert.addAction(okAction)
        self.present(registerAlert, animated: true, completion: nil)
        
        
    }
    // MARK: 알림창 함수
    func displayAlertMSG(_ userMessage: String)
    {
        let alertWindow = UIAlertController(title: "알림", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
        alertWindow.addAction(okAction)
        
        self.present(alertWindow, animated: true, completion: nil)
        
    }
    
    // MARK: 데이터 저장 함수
    func storeData(_ value: Any, forKey: String)
    {
        UserDefaults.standard.set(value, forKey: forKey)
    }
    
    // MARK: Life of Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    
 

}

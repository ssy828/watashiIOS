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
    
    
   
    // MARK: Life of Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

 // MARK: 회원가입버튼 누를 경우
extension RegisterViewController
{
   
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

//        registerAlert.addAction(okAction)
//        self.present(registerAlert, animated: true, completion: nil)
        
          // 가입완료 알림창
        displayAlertMSG(userMessage: "가입을 축하합니다") { (Okaction) in
            //self.dismiss(animated: true, completion: nil)
            // dismiss는 뷰컨트롤러끼리 할 때!
            
            // ok버튼을 눌렀을때 사용
            // 네비게이션일 경우: 루트뷰로 넘기는 방식이거나 pop으로 넘기는 것
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        let alert = UIAlertController(title: "테스트!", message: "완료", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
}

// MARK: 메소드
extension RegisterViewController
{
    // MARK: 알림창 함수
    func displayAlertMSG(_ userMessage: String)
    {
        let alertWindow = UIAlertController(title: "알림", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
        alertWindow.addAction(okAction)
        self.present(alertWindow, animated: true, completion: nil)
        
    }
    
    // MARK: 매개변수를 하나 더 만들어서 클로저를 받는 매개변수를 만들어서 다른 메소드를 만들 것!
    func displayAlertMSG(userMessage: String, handler: ((UIAlertAction) -> Void)? )
    {
        let alertWindow = UIAlertController(title: "알림", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: handler)

        alertWindow.addAction(okAction)
        self.present(alertWindow, animated: true, completion: nil)
    }
    
    // MARK: 데이터 저장 함수
    func storeData(_ value: Any, forKey: String)
    {
        // UserDefaults: 간단한 정보일경우만 가능
        // plist: 더 많은 사용자 정보를 담을 경우 사용
        UserDefaults.standard.set(value, forKey: forKey)
    }
    
}

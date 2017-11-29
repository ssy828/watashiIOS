//
//  ViewController.swift
//  Test

import UIKit
import Firebase
class SignUpViewController: UIViewController {
    // MARK: IBOutlet
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var pwdTF: UITextField!
    @IBOutlet weak var rePwdTF: UITextField!
    @IBOutlet weak var nickNamdTF: UITextField!
    
    // MARK: Property
    lazy var reference = Database.database().reference()
    let segueSignUpToMain = "segueSignUpToMain"
    
    // MARK: IBAction
    // 회원가입 버튼
    @IBAction func signUpBtn(_ sender: UIButton) {
        guard let email = emailTF.text, !email.isEmpty else{
            UIAlertController.presentAlertController(target: self,
                                                     title: "이메일을 입력해주세요,",
                                                     massage: nil,
                                                     cancelBtn: false,
                                                     completion: nil)
            return
        }
        guard let pwd = pwdTF.text, !pwd.isEmpty else{
            UIAlertController.presentAlertController(target: self,
                                                     title: "비밀번호를 입력해주세요.",
                                                     massage: nil,
                                                     cancelBtn: false,
                                                     completion: nil)
            return
        }
        guard let rePwd = rePwdTF.text, !rePwd.isEmpty else{
            UIAlertController.presentAlertController(target: self,
                                                     title: "비밀번호를 다시 입력해주세요.",
                                                     massage: nil,
                                                     cancelBtn: false,
                                                     completion: nil)
            return
        }
        guard let nickName = nickNamdTF.text, !nickName.isEmpty else{
            UIAlertController.presentAlertController(target: self,
                                                     title: "닉네임을 입력해주세요.",
                                                     massage: nil,
                                                     cancelBtn: false,
                                                     completion: nil)
            return
        }
        if pwd != rePwd {
            UIAlertController.presentAlertController(target: self,
                                                     title: "비밀번호가 다릅니다.",
                                                     massage: nil,
                                                     cancelBtn: false,
                                                     completion: nil)
        }else{
            Auth.auth().createUser(withEmail: email, password: pwd, completion: { [weak self] (user, error) in
                print("Error",error?.localizedDescription)
                guard let `self` = self else { return }
                if error == nil, let user = user{
                    let profileChangeRequest = user.createProfileChangeRequest()
                    profileChangeRequest.displayName = nickName
                    profileChangeRequest.commitChanges(completion: nil)
                    let userDictionary : [String: Any] = ["user":["email": user.email,"nickname": nickName]]
                    self.reference.child(user.uid).setValue(userDictionary)
                    UIAlertController.presentAlertController(target: self,
                                                             title: "가입축하",
                                                             massage: "가입을 축하드립니다.",
                                                             actionStyle: .default,
                                                             cancelBtn: false,
                                                             completion: { _ in
                    self.performSegue(withIdentifier: self.segueSignUpToMain, sender: nil)
                    })
                }
            })
        }
    }

    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}


import UIKit
import Firebase
import SwiftKeychainWrapper
import FBSDKLoginKit

let userAccount = "account"

class LoginViewController: UIViewController {
    
    // MARK: IBOutlet
    @IBOutlet weak var faceBookBtn: FBSDKLoginButton!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var pwdTF: UITextField!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var loginScrollView: UIScrollView!
    
    // MARK: Property
    let segueLoginToMain = "segueLoginToMain"
    
    // MARK: IBAction
    @IBAction func loginBtn(_ sender: UIButton) {
        guard let email = emailTF.text, !email.isEmpty else {
            UIAlertController.presentAlertController(target: self,
                                                     title: "이메일을 입력해 주세요.",
                                                     massage: nil,
                                                     actionStyle: .default,
                                                     cancelBtn: false,
                                                     completion: nil)
            return
        }
        guard let pwd = pwdTF.text, !pwd.isEmpty else {
            UIAlertController.presentAlertController(target: self,
                                                     title: "비밀번호를 입력해 주세요.",
                                                     massage: nil,
                                                     actionStyle: .default,
                                                     cancelBtn: false,
                                                     completion: nil)
            return
        }
        Auth.auth().signIn(withEmail: email, password: pwd) { [weak self] (user, error) in
            guard let `self` = self else { return }
            if error == nil, user != nil{
                let account = Account(email: email, password: pwd)
                do{
                    let data = try JSONEncoder().encode(account)
                    KeychainWrapper.standard.set(data, forKey: userAccount)
                    self.performSegue(withIdentifier: self.segueLoginToMain, sender: nil)
                }catch (let error){
                    print("\(error.localizedDescription)")
                }
            }else{
                UIAlertController.presentAlertController(target: self,
                                                         title: "이메일 또는 비밀번호가\n 잘못되었습니다.",
                                                         massage: nil,
                                                         actionStyle: .default,
                                                         cancelBtn: false,
                                                         completion: nil)
            }
        }
    }
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let keychainStr = KeychainWrapper.standard.data(forKey: userAccount)
        print("KEEEEEEY",keychainStr)
        faceBookBtn.delegate = self
        FBSDKLoginManager().logOut()
        // MARK: 제스처
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backGroundTapKeyboardHide(_:))))
        
        // MARK: keyboard notification
        NotificationCenter.default.addObserver(self, selector: #selector(keyboradDidShow(noti:)), name: .UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(noti:)), name: .UIKeyboardWillHide, object: nil)
        
    }
    
}

extension LoginViewController {
    // MARK: 탭제스처
    @objc func backGroundTapKeyboardHide(_ tap: UITapGestureRecognizer){
        for view in contentView.subviews {
            view.endEditing(true)
        }
    }
    // MARK: keyboradDidShow
    @objc func keyboradDidShow(noti: Notification) {
        guard let userInfo = noti.userInfo else { return }
        guard let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        loginScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
    }
    // MARK: keyboardWillHide
    @objc func keyboardWillHide(noti: Notification) {
        loginScrollView.contentInset = UIEdgeInsets.zero
    }
}

// MARK: UITextFieldDelegate
extension LoginViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pwdTF.resignFirstResponder()
        return true
    }
}
// MARK: FBSDKLoginButtonDelegate
extension LoginViewController: FBSDKLoginButtonDelegate {
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult?, error: Error!) {
//        if result?.token == nil {
//            return
//        }
//        print(FBSDKAccessToken.current().tokenString)
        if error != nil {
            print("error")
            return
        }
        
        let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
        
        Auth.auth().signIn(with: credential) { (user, error) in
            if error == nil, user != nil {
                if let user = user {
                    let fbAccount = FBAccount(email: user.email, id: user.uid)
                    do{
                        let data = try JSONEncoder().encode(fbAccount)
//                        KeychainWrapper.standard.set(data, forKey: userAccount)
                        self.performSegue(withIdentifier: self.segueLoginToMain, sender: nil)
                    }catch (let error){
                        print("\(error.localizedDescription)")
                    }
                }
                
            }
            
            
        }
    }
    
}



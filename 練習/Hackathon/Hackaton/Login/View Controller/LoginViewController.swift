
import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    //MARK: - Property
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - App Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(noti:)), name: .UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(noti:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    //MARK: - Notification Center
    @objc func keyboardWillShow(noti: Notification) {
        guard let userInfo = noti.userInfo else { return }
        guard let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else { return }
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
    }
    
    @objc func keyboardWillHide(noti: Notification) {
        scrollView.contentInset = UIEdgeInsets.zero
    }
    
    //MARK: - Method
    @IBAction func loginButtonAction(_ sender: CustomButton) {
        guard let id = emailTextField.text else { return }
        guard let pw = passwordTextField.text else { return }
        
        //파이어베이스 로그인
        Auth.auth().signIn(withEmail: id, password: pw) { (user, error) in
            if error == nil && user != nil {
                UserDefaults.standard.set(id, forKey: "username")
                let alertSheet = UIAlertController(title: "로그인 성공", message: "로그인 성공", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "확인", style: .default, handler: { (action) in
                    let mainstoryBoard = UIStoryboard(name: "Main", bundle: nil)
                    if let mainVC = mainstoryBoard.instantiateViewController(withIdentifier: "Main") as? UINavigationController {
                        self.present(mainVC, animated: true, completion: nil)
                    }
                })
                alertSheet.addAction(okAction)
                self.present(alertSheet, animated: true, completion: nil)
            }else {
                print(error!.localizedDescription)
            }
        }
    }
}

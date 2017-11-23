import UIKit
import Firebase
import SnapKit

class SignInViewController: UIViewController {
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    var emailTF: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.placeholder = "이메일 입력해주세요"
        return textField
    }()
    
    var passwordTF: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    var rePasswordTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "다시 비밀번호를 입력해주세요"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    var signUpBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("회원가입", for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.5764705882, green: 1, blue: 0.8745098039, alpha: 1)
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    var logo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo.png")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    var contentView: UIView = {
        return UIView()
    }()
    
    // MARK: 데이터베이스
    lazy var reference : DatabaseReference = Database.database().reference()
    
    // MARK: Life Cyle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 1, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        self.view.addSubview(scrollView)
        
        // 스크롤뷰 오토레이아웃
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view)
            $0.leading.equalTo(view)
            $0.trailing.equalTo(view)
            $0.bottom.equalTo(view)
        }
        scrollView.addSubview(contentView)
        
        // 컨텐츠뷰 오토레이아웃
        contentView.snp.makeConstraints {
            $0.top.equalTo(scrollView)
            $0.leading.equalTo(scrollView)
            $0.trailing.equalTo(scrollView)
            $0.bottom.equalTo(scrollView)
            $0.width.equalTo(view)
            $0.height.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.addSubview(logo)
        
        // 로고 오토레이아웃
        logo.snp.makeConstraints {
            $0.top.equalTo(contentView).offset(15)
            $0.centerX.equalTo(contentView)
        }
        
        contentView.addSubview(stackView)
        
        // 스택뷰 오토레이아웃
        stackView.snp.makeConstraints {
            $0.top.equalTo(logo.snp.bottom).offset(20)
            $0.left.equalTo(contentView).offset(10)
            $0.right.equalTo(contentView).offset(-10)
            $0.bottom.equalTo(contentView).offset(-100)
        }
        // 스택뷰 위에 필드와 버튼 올림
        stackView.addArrangedSubview(emailTF)
        stackView.addArrangedSubview(passwordTF)
        stackView.addArrangedSubview(rePasswordTF)
        stackView.addArrangedSubview(signUpBtn)
        
        signUpBtn.addTarget(self, action: #selector(signUp(_:)), for: .touchUpInside)
        
        //MARK: 키보드 노티
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(noti:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(noti:)), name: .UIKeyboardWillHide, object: nil)
        // MARK: 키보드를 탭으로 내림
        view.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(handleTouchView(_:))))
    }
    
    @objc func handleTouchView(_ sender: UITapGestureRecognizer){
        if emailTF.isFirstResponder {
            emailTF.resignFirstResponder()
        } else if passwordTF.isFirstResponder {
            passwordTF.resignFirstResponder()
        } else if rePasswordTF.isFirstResponder {
            rePasswordTF.resignFirstResponder()
        }
    }
    
    // MARK: signUp 버튼
    @objc func signUp(_ sender: UIButton)
    {
        guard let account = emailTF.text, !account.isEmpty else {
            UIAlertController.present(target: self, msg: "이메일을 입력해주세요.")
            return
        }
        guard let pwd = passwordTF.text, !pwd.isEmpty else {
            UIAlertController.present(target: self, msg: "비밀번호를 입력해주세요.")
            return
        }
        guard let rePwd = rePasswordTF.text, !rePwd.isEmpty else {
            UIAlertController.present(target: self, msg: "다시 비밀번호를 입력해주세요.")
            return
        }
        
        if pwd != rePwd
        {
            UIAlertController.present(target: self, msg: "틀려요")
        }else{
            Auth.auth().createUser(withEmail: account, password: pwd, completion: {[weak self] (user, error) in
                guard let `self` = self else { return }
                if error == nil && user != nil{
                    let userDic: [String: Any] = ["user": account]
                    self.reference.child(user!.uid).setValue(userDic)
                    
                    UIAlertController.present(target: self, msg: "가입되었습니다.") { _ in
                        self.performSegue(withIdentifier: "unwindSegueSignInToLogin", sender: nil)
                    }
                }
            })
        }
    }
    // MARK: 키보드 보일때
    @objc func keyboardWillShow(noti: Notification) {
        if let keyboardHeight = noti.keyboardHeight {
            scrollView.handleKeyboardShow(keyboardHeight: keyboardHeight, visibleTarget: signUpBtn.frame)
        }
    }
    
    @objc func keyboardWillHide(noti: Notification) {
        scrollView.contentInset = .zero
        scrollView.scrollIndicatorInsets = .zero
    }
    
}
//MARK: 알림창
extension UIAlertController{
    static func present(target: UIViewController, msg: String, handler: ((UIAlertAction) -> Void)? = nil){
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(title: "확인", style: .cancel, handler: handler)
        )
        target.present(alert, animated: true, completion: nil)
    }
}


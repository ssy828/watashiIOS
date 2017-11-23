import UIKit
import Firebase

class LoginViewController: UIViewController {
    
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
    
    var loginBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("로그인", for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.1849034429, green: 0.3043515086, blue: 0.4955952168, alpha: 1)
        btn.layer.cornerRadius = 5
        return btn
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
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    var contentView: UIView = {
        return UIView()
    }()
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var reference : DatabaseReference = Database.database().reference()
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 1, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        self.view.addSubview(scrollView)
        // 스크롤뷰 오토레이아웃
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
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
        stackView.addArrangedSubview(loginBtn)
        stackView.addArrangedSubview(signUpBtn)
        
        loginBtn.addTarget(self, action: #selector(logIn(_:)), for: .touchUpInside)
        signUpBtn.addTarget(self, action: #selector(signIn(_:)), for: .touchUpInside)
        
        //MARK: 키보드 노티
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(noti:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(noti:)), name: .UIKeyboardWillHide, object: nil)
        
        // MARK: 키보드를 탭으로 내림
        view.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(handleTouchView(_:))))
    }
    // MARK: 키보드 
    @objc func handleTouchView(_ sender: UITapGestureRecognizer){
        if emailTF.isFirstResponder {
            emailTF.resignFirstResponder()
        } else if passwordTF.isFirstResponder {
            passwordTF.resignFirstResponder()
        }
    }
    // MARK: 로그인 버튼
    @objc func logIn(_ sender: UIButton)
    {
        guard let account = emailTF.text, !account.isEmpty else { return }
        guard let pwd = passwordTF.text, !pwd.isEmpty else { return }
        Auth.auth().signIn(withEmail: account, password: pwd) { (user, error) in
            if error == nil, let user = user {
                /*user.getIDToken(completion: { token, error in
                 if let token = token {
                 UserDefaults.standard.setValue(token, forKey: "FirebaseUserToken")
                 }
                 })*/
                self.performSegue(withIdentifier: "segueLoginToMain", sender: nil)
            } else {
                UIAlertController.present(target: self, msg: "이메일 또는 비밀번호가 잘못되었습니다.")
            }
        }
        
    }
    // MARK: 회원가입 버튼
    @objc func signIn(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "segueLoginToSignIn", sender: nil)
    }
    //MARK: 키보드 보일때
    @objc func keyboardWillShow(noti: Notification) {
        if let keyboardHeight = noti.keyboardHeight {
            scrollView.handleKeyboardShow(keyboardHeight: keyboardHeight, visibleTarget: loginBtn.frame)
        }
    }
    //MARK: 키보드 안 보일때
    @objc func keyboardWillHide(noti: Notification) {
        scrollView.contentInset = .zero
        scrollView.scrollIndicatorInsets = .zero
    }
    // MARK:
    @IBAction func unwind(_ segue: UIStoryboardSegue){}
    
}


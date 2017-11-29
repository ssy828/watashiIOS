
import UIKit

class LoginAndSignUpView: UIView {
    
    // MARK: 버튼
//    @IBOutlet weak var signUpBtn: UIButton! // 회원가입페이지로 넘어가는 버튼
    @IBOutlet weak var logInBtn: UIButton! // 로그인 버튼
    @IBOutlet weak var newMemberBtn: UIButton! // 회원가입등록버튼
    
    //MARK: 텍스트필드
//    @IBOutlet weak var emailTF: UITextField!
//    @IBOutlet weak var pwdTF: UITextField!
    @IBOutlet weak var newEmailTF: UITextField!
    @IBOutlet weak var newPwdTF: UITextField!
    @IBOutlet weak var newRePwdTF: UITextField!
    @IBOutlet weak var newNickNameTF: UITextField!
    
    // MARK: 뷰
    @IBOutlet weak var loginBGView: UIView!
   
    
    // MARK: Login + SignUp View Setting
    override func awakeFromNib() {
        
    }
    
    // MARK: Login + SignUp View Setting
    override func layoutSubviews() {
//        loginBGView.roundCorners(corners: [.topRight, .bottomRight], radius: 20)
//        loginBGView.dropShadow()
//        logInBtn?.layer.cornerRadius = logInBtn.frame.size.height / 2
        loginBGView.layer.cornerRadius = 20
        loginBGView.layer.borderWidth = 3
        loginBGView.layer.borderColor = #colorLiteral(red: 0.9803921569, green: 0.937254902, blue: 0.2941176471, alpha: 1)
        
//        logInBtn?.buttonLayer(cornerRadius: 10, borderWidth: 2, borderColor: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
//        signUpBtn?.buttonLayer(cornerRadius: 10, borderWidth: 2, borderColor: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
//        newMemberBtn?.buttonLayer(cornerRadius: 10, borderWidth: 2, borderColor: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
//        
       
        newEmailTF?.addBorderBottom(height: 1, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        newPwdTF?.addBorderBottom(height: 1, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        newRePwdTF?.addBorderBottom(height: 1, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        newNickNameTF?.addBorderBottom(height: 1, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        
    }
}
// MARK: UIButton
extension UIButton {
    // MARK: 버튼 레이아웃
    func buttonLayer(cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: CGColor) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
    }
}

// MARK: UITextField
extension UITextField {
    
    // MARK: 텍스트필드 밑줄
    func addBorderBottom(height:CGFloat, color: UIColor) {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: self.frame.height-height, width: self.frame.width, height: height)
        border.backgroundColor = color.cgColor
        self.layer.addSublayer(border)
    }
}




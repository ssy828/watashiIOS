//
//  CustomCell.swift
//  UsingAlamofire
import UIKit

class CustomCell: UITableViewCell {
    // 이곳에서만 사용해 이넘을 사용해
    enum TextFieldStyle{
        case account // 계정
        case name // 이름
        case pwd // 비밀번호 필드
    }
    
    // 셀에 들어갈 텍스트필드
   weak var textField: UITextField!
    
    // MARK: awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    // MARK: setSelected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //MARK: 셀에 보여질 부분도 뷰이므로 커스텀셀로 옮김
    func configureTF(style: TextFieldStyle)
    {
        // 각 테이블 뷰 셀 모두에 공통으로 적용될 프레임 객체
        let tfFrame = CGRect(x: 20, y: 0, width: self.bounds.width - 30, height: 35)
        self.textField = UITextField(frame: tfFrame)
        switch style {
        case .account:
            self.textField.placeholder = "계정(이메일)"
            self.textField.autocapitalizationType = .none
        case .pwd:
            self.textField.isSecureTextEntry = true
            self.textField.placeholder = "비밀번호"
        case .name:
            self.textField.placeholder = "이름"
            self.textField.autocorrectionType = .no
            self.textField.autocapitalizationType = .none
        }
        self.textField.font = UIFont.systemFont(ofSize: 15)
        self.textField.borderStyle = .none
        addSubview(textField)
    }
}

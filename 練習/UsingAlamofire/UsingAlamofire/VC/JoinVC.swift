//
//  JoinVC.swift
//  UsingAlamofire

import UIKit
import Alamofire

class JoinVC: UIViewController {
    // MARK: API 호출 상태값을 관리할 변수
    var isCalling = false
    // MARK: 텍스트필드
//    var fieldAccount: UITextField!
//    var fieldPassword: UITextField!
//    var fieldName: UITextField!
    // MARK: cell ID
    let cellID = "cell"
    // MARK: TEST
    var test: CustomCell?
    // MARK : UI
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    // MARK: 버튼
    @IBAction func submit(_ sender: Any) {
        
        // API 호출 상태를 관리함
        if isCalling {
            self.alert("진행 중입니다! 잠시만 기다려주세요 ")
            return // 완료료 클로저에 대한 종료
        }else{
            self.isCalling = true
        }
        // 인디케이터 뷰 애니메이션 시작
        self.indicatorView.startAnimating()
        // POST 방식
        // 1.전달할 값 준비
        // 1-1. 이미지를 Base64 인코딩 처리
        let profile = UIImagePNGRepresentation(self.profile.image!)?.base64EncodedString()
        // 1-2. 전달값 Parameters 타입 객체로 정의
        
        let cell1 = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! CustomCell
        let cell2 = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as! CustomCell
        let cell3 = tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as! CustomCell
        
        let param: Parameters = [
            "account" : cell1.textField.text ?? "이름 전송 실패",
            "passwd" : cell2.textField.text ?? "비밀번호 전송실패",
            "name" : cell3.textField.text ?? "이름 전송 실패",
            "profile_image": profile!
        ]
        // 2. API
        let url = "http://swiftapi.rubypaper.co.kr:2029/userAccount/join"
        let call = Alamofire.request(url, method: .post, parameters: param, encoding: JSONEncoding.default, headers: .none)
        
        // 3. 서버 응답값 처리
        call.responseJSON { [weak self] response in
            guard let `self` = self else { return }
            // 인디케이터 뷰 애니메이션 종료
            self.indicatorView.stopAnimating()
            // 3-1. JSON 형식으로 값이 제대로 전달되었는지 확인
            guard let jsonOb = response.result.value as? [String: Any] else {
                self.isCalling = false
                self.alert("서버 호출 과정에서 오류 발생")
                return
            }
            
            // 3-2. 응답코드 확인. 0이면 성공
            let resultCode = jsonOb["result_code"] as! Int
            if resultCode == 0 {
                self.alert("가입이 완료되었습니다!"){
                    self.performSegue(withIdentifier: "backProfileVC", sender: self)
                }
            } else {
                // 3-4. 응답 코드가 0이 아닐때에 실패
                self.isCalling = false
                let erroMsg = jsonOb["error_msg"] as! String
                self.alert("오류발생: \(erroMsg)")
            }
        }
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // 테이블 뷰의 데이터소스,델리게이트 속성 지정
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // 프로필 이미지를 원형으로 설정
        self.profile.layer.cornerRadius = self.profile.frame.width / 2
        self.profile.layer.masksToBounds = true
        
        // 프로필 이미지에 탭 제스처 및 액션 이베튼 설정
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tappedProfile))
        self.profile.addGestureRecognizer(gesture)
        self.view.bringSubview(toFront: self.indicatorView) // 인디케이터 뷰를 맨 앞으로 부르는 코드
        
    }
    
    
}

// MARK: UINavigationControllerDelegate
extension JoinVC: UINavigationControllerDelegate
{
    
    
}
// MARK: UIImagePickerControllerDelegate
extension JoinVC: UIImagePickerControllerDelegate
{
    // MARK: func tappedProfile
    // 이미지 소스를 선택가능하게 액션 시트 창 열어주는 곳
    @objc func tappedProfile(_ sender: Any){
        let msg = "프로필 읽어올 곳을 선택하세요"
        let sheet = UIAlertController(title: msg, message: nil, preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "저장된 앨범", style: .default, handler: { _ in
            selectLibrary(src: .savedPhotosAlbum) // 저장된 앨범에서 이미지 선택
        }))
        sheet.addAction(UIAlertAction(title: "포토 라이브러리", style: .default, handler: { _ in
            selectLibrary(src: .photoLibrary)
        }))
        self.present(sheet, animated: false, completion: nil)
        
        // 사용자가 특정 액션 시트에서 특정 버튼을 누르면 그에 맞는 이미지 피커 컨트롤러 실행
        func selectLibrary(src: UIImagePickerControllerSourceType)
        {
            if UIImagePickerController.isSourceTypeAvailable(src)
            {
                let picker = UIImagePickerController()
                picker.delegate = self
                picker.allowsEditing = true
                
                self.present(picker, animated: false, completion: nil)
            }else{
                self.alert("사용할 수 없는 정보")
            }
        }
    }
    // MARK: 사용자가 이미지 피커 컨트롤러에서 이미지를 선택햇을 때 실행될 델리게이트 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            self.profile.image = img
        }
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: UITableViewDelegate
extension JoinVC: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

// MARK: UITableViewDataSource
extension JoinVC: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CustomCell
//        // 각 테이블 뷰 셀 모두에 공통으로 적용될 프레임 객체
//        let tfFrame = CGRect(x: 20, y: 0, width: cell.bounds.width - 20, height: 37)
//        switch indexPath.row {
//        case 0 :
//            self.fieldAccount = UITextField(frame: tfFrame)
//            self.fieldAccount.placeholder = "계정(이메일)"
//            self.fieldAccount.borderStyle = .none
//            self.fieldAccount.autocapitalizationType = .none
//            self.fieldAccount.font = UIFont.systemFont(ofSize: 14)
//            cell.addSubview(self.fieldAccount)
//        case 1 :
//            self.fieldPassword = UITextField(frame: tfFrame)
//            self.fieldPassword.placeholder = "비밀번호"
//            self.fieldPassword.borderStyle = .none
//            self.fieldPassword.isSecureTextEntry = true
//            self.fieldPassword.font = UIFont.systemFont(ofSize: 14)
//            cell.addSubview(self.fieldPassword)
//        case 2 :
//            self.fieldName = UITextField(frame: tfFrame)
//            self.fieldName.placeholder = "이름"
//            self.fieldName.borderStyle = .none
//            self.fieldName.font = UIFont.systemFont(ofSize: 14)
//            cell.addSubview(self.fieldName)
//        default :
//            break
//        }
        
        switch indexPath.row {
        case 0:
            cell.configureTF(style: .account)
        case 1:
            cell.configureTF(style: .pwd)
        case 2:
            cell.configureTF(style: .name)
        default:
            break
        }
        return cell
    }
}



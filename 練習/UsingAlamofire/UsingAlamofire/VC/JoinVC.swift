//
//  JoinVC.swift
//  UsingAlamofire

import UIKit
import Alamofire

class JoinVC: UIViewController {
    // MARK : UI
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBAction func submit(_ sender: Any) {
        
    }
    
    let cellID = "cell"
    let tfFrame = CGRect(x: 20, y: 0, width: 50, height: 35)
    
    // 테이블 뷰에 들어갈 텍스트 필드
    var account: UITextField!
    var password: UITextField!
    var name: UITextField!
    
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
        
        // 각 테이블 뷰 셀 모두에 공통으로 적용될 프레임 객체
        let tfFrame = CGRect(x: 20, y: 0, width: cell.bounds.width - 30, height: 35)
        switch indexPath.row {
        case 0:
            self.account = UITextField(frame: tfFrame)
            self.account?.placeholder = "계정(이메일)"
            self.account?.borderStyle = .none
            self.account?.autocapitalizationType = .none
        case 1:
            self.password = UITextField(frame: tfFrame)
            self.password?.placeholder = "비밀번호"
            self.password?.borderStyle = .none
            self.password?.isSecureTextEntry = true
        case 2:
            self.name = UITextField(frame: tfFrame)
            self.name.placeholder = "이름"
            self.name.borderStyle = .none
            self.name.font = UIFont.systemFont(ofSize: 15)
            cell.addSubview(self.name)
        default:
            break
        }
        return cell
    }
}



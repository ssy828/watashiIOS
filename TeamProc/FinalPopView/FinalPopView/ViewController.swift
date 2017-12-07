//
//  ViewController.swift
//  FinalPopView
import UIKit

class ViewController: UIViewController {

//    @IBOutlet weak var popView: PopView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpPopUpView()
    }

    // MARK: 팝업뷰 세팅
    func setUpPopUpView() {
        // 사용자 정의 팝업
        let popUpView: PopView = UINib(nibName: "View", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! PopView
        // 팝업뷰 생성
        let viewColor = UIColor.black
        // 부모뷰 투명
        popUpView.backgroundColor = viewColor.withAlphaComponent(0.3)
        popUpView.frame = self.view.bounds // 팝업 뷰를 화면에 맞게
        // 팝업창 배경색
        let baseViewColor = UIColor.white
        // 팝업 배경
        popUpView.baseView.backgroundColor = baseViewColor.withAlphaComponent(0.8)
        // 팝업 뷰 테두리
        popUpView.baseView.layer.cornerRadius = 20
        self.view.addSubview(popUpView)
    }

}


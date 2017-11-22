//
//  MainViewController.swift
//  UsingAlamofire

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: Unwind 세그웨이 이용: 화면 이동
    @IBAction func backProfileVC(_ segue: UIStoryboardSegue)
    {
        // 프로필 화면으로 되돌아오기 위한 표식 역할만 할 뿐 어떤 내용도 필요 없음
    }
}

//
//  ViewController.swift
//  TestDelegate
//
//  Created by SONGYEE SHIN on 2017. 10. 12..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit
// 구현!!
class ViewController: UIViewController,CustomViewDelegate {
    
    // 커스텀뷰랑 연결할 인스턴스가 필요함
    // 뷰컨트롤러(루트뷰)위에 올려야하므로!
    @IBOutlet var newView: CustomView!
  

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newView.delegate = self // self: 뷰컨트롤러 인스턴스임
        
    }

    // 스위치를 끄면 라이언 캐릭터가 나옴
    func didSwitchOff(_ cutomview: CustomView) {
        let imgA: UIImage? = UIImage(named: "라이언.jpg")
        newView.imageView.contentMode = .scaleAspectFit
        newView.imageView.image = imgA
        // 커스텀뷰랑 컨트롤러뷰랑 연결하는 인스턴스가 이미지뷰(프로퍼티)의 image메소드에 imgA할당
        newView.lb.text = "라이언"
    }
    
    // 스위치를 켜면 프로도 캐릭터가 나옴
    func didSwitchOn(_ customview: CustomView) {
        let imgB: UIImage? = UIImage(named: "프로도.jpg")
        // 이미지뷰 크기 현재 크기 맞춤
        newView.imageView.contentMode = .scaleAspectFit
        // 커스텀뷰 연결하는 인스턴스가 이미지뷰 인스턴스가 이미지프로퍼티에 이미지B할당!
        newView.imageView.image = imgB
        newView.lb.text = "프로도"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


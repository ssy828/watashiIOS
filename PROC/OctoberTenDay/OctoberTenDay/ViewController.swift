//
//  ViewController.swift
//  OctoberTenDay
//
//  Created by SONGYEE SHIN on 2017. 10. 10..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 시작점!!
    override func viewDidLoad() {
        // override: UIViewController가 호출하는 것
        super.viewDidLoad()
        
        // UI어플리케이션 델리게이트를 사용할수 있게 해주는 것
        // UI어플리케이션 인스턴스 -> main.스토리보드에 있는 initial부분 UI를 가지고 만듦
        // 일종의 클래스임 UI를 보여주는 설계도면: 스토리보드
        // 뷰컨트롤러 클래스가 뷰컨트롤러 인스턴스를 만듦
        // 2가지 인스턴스 만들어냄
        // 루트뷰를 기본적으로 가짐 그 위에 UI를 올리는 것!
        // 뷰 디드로드: 코드가 실행이 되게끔 하는 것
        
        // 스크롤뷰
        // frame
        let sc: UIScrollView = UIScrollView(frame:view.bounds)
        // 속성
        // delegate
        //
        
        //contentSize
        sc.contentSize = CGSize(width: sc.frame.size.width*3, height: sc.frame.size.height)
        // view에 추가
        view.addSubview(sc)
        
        // 스크롤 뷰의 뷰추가
        let subview: UIView = UIView()
        subview.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        subview.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        sc.addSubview(subview)
        
        let subview2: UIView = UIView()
        subview2.frame = CGRect(x: sc.frame.size.width, y: 0, width: 300, height: 300)
        sc.addSubview(subview2)
        
        let subView : UIView = UIView()
        subView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        subView.backgroundColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        self.view.addSubview(subView)
        // self.view = viewController의 루트 뷰 인스턴스
        
        let label: UILabel = UILabel()
        label.frame = CGRect(x: 0, y: 310, width: 400, height: 400)
        label.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        label.numberOfLines = 0 // 무제한
        view.addSubview(label)
        
        let btn: UIButton = UIButton()
        btn.frame = CGRect(x: 0, y: label.bounds.size.height+50, width: 300, height: 300)
        btn.layer.cornerRadius = 10
        btn.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        view.addSubview(btn)
        
//        let scroll: UIScrollView = UIScrollView()
//        scroll.frame = CGRect(x: 300, y: 300, width: view.bounds.size.width/2, height: view.bounds.size.height/2)
//        scroll.contentSize = CGSize(width: view.frame.size.width*2, height: view.frame.size.height)
//        scroll.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
//        view.addSubview(scroll)
        
        
        let tf: UITextField = UITextField(frame: CGRect(x: 20, y: 20, width: 300, height: 300))
        tf.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        view.addSubview(tf)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


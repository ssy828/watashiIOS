//
//  NewViewController.swift
//  UIViewTrainning
//
//  Created by SONGYEE SHIN on 2017. 9. 26..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
    
    // 로그인 창
    var idLb:UILabel? // 아이디 쓸 레이블
    var pwdLb:UILabel?// 비밀번호 쓸 레이블
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        idLb = UILabel(frame:CGRect(x: 100, y: 100, width: 200, height: 50))
        view.addSubview(idLb!) // 전체 뷰에 아이디레이블 추가
        idLb?.layer.borderWidth = 3
        // idLb?.layer.borderColor = UIColor.blue.cgColor // ???
        idLb?.layer.borderColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

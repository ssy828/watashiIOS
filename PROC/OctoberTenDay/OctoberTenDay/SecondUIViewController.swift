//
//  SecondUIViewController.swift
//  OctoberTenDay
//
//  Created by SONGYEE SHIN on 2017. 10. 10..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class SecondUIViewController: UIViewController {
    
 @IBOutlet weak var displayLb: UILabel!
    
    var sendMSG: String?
    func sendMsg(_ msg: String)
    {
        sendMSG = msg
        // 뷰디드로드 되기전에 만들어지므로 nil이므로
        // 전역변수를 만들것!
        // 위에 옵셔널인데도 가능한 이유:
        // 파라미터를 통해서 빈 박스에 값을 넣어주는 것이므로
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let closeBtn = UIButton(type: UIButtonType.system) // 기본: .custom
        closeBtn.frame = CGRect(x: 50, y: 50, width: 50, height: 30)
        closeBtn.setTitle("닫기", for:.normal)
        closeBtn.setTitleColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), for: UIControlState.normal)
        // 버튼에서 가장 중요한것!! : 타겟팅!!
        closeBtn.addTarget(self, action: #selector(self.close(_:)),for: .touchUpInside)
        view.addSubview(closeBtn)
        
        // 추가
        print("viewDidLoad")
        displayLb.text = sendMSG // 뷰디드로드가 실행될때 값을 뿌림
    }
    
   
    @objc func close(_ sender: UIButton ) {
        // dismiss
        dismiss(animated: true, completion: nil)
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

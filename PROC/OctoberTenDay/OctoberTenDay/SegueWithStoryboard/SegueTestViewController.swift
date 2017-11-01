//
//  SegTestViewController.swift
//  OctoberTenDay
//
//  Created by SONGYEE SHIN on 2017. 10. 10..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class SegueTestViewController: UIViewController {

    var isAbleToNext: Bool = true
    
    @IBOutlet weak var tf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func ableToNextSwitch(_ sender: UISwitch)
    {
        isAbleToNext = sender.isOn
    }
    // 다음 세그를 실행할지에 대한 선택
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        // 특정 세그를 제어할 경우
        if identifier == "nextSecondVCSegue"{
            return isAbleToNext
        }else{
            return false
        }
      //  return isAbleToNext // 버튼을 눌렀을 때 값을 반환!
        // 지금 모든 세그를 다 제어함.
    }
    
    // 데이터를 보내거나
    // 화면이 전환되기 직전에 해야할 것!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print("prepare")
        let sendStr = tf.text ?? "noText" // ??: 값이 없을 경우 이 값으로 해라: 디폴트값지정
        
       let destinationVC = segue.destination as! SecondUIViewController
        // 도착점: 뷰컨트롤러 -> 인스턴스가 만들어지고 다음 인스턴스에 뷰컨트롤러를 가져옴
        destinationVC.sendMsg(sendStr) 
        // destinationVC.sendMsg = sendStr도 가능!
    }
    
    // 세그 돌아가기
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue)
    {
        // UIStoryboardSegue이 타입을 받는 것이 젤로 중요함!
        
        // uwind segue 진행후 작성할 내용
        
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

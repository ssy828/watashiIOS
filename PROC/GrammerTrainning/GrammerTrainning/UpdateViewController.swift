//
//  UpdateViewController.swift
//  GrammerTrainning
//
//  Created by SONGYEE SHIN on 2017. 9. 24..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class UpdateViewController: UIViewController {
    
    @IBOutlet var dayLB: UILabel!
    @IBOutlet var secondLB: UILabel!
    @IBOutlet var thirdLB: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

//        let gettingADayInstance: GettingAday = GettingAday()
        // let result = gettingADayInstance.lastDay(month: 8)
        //let result = gettingADayInstance.lastDay(month: 12,day: 7)
        //let r = gettingADayInstance.lastDay(month: 8, day: 15)
        //let s = gettingADayInstance.lastDay(month: 5,day: 23)
      //  let res = gettingADayInstance.lastDay(month:6,day: 10)
//        let result = gettingADayInstance.getWeekDay(atMonth: 6, atDay: 14)
//
//        dayLB.text = "\(result)"
//
        // var result: GettingAday = GettingAday()
        // result.lastDay(month: 4)
        // 그럼 result 인스턴스를 생성하고 그 값을 담을 변수가 없으므로 메소드를 사용하지 않았다고 뜸
        // dayLB.text = "\(s)"
       // secondLB.text = "\(r)"
        //thirdLB.text = "\(res)"
    }
    
    @IBAction func dayBtn(btn:UIButton){
        let gettingADayInstance: GettingAday = GettingAday()
        let result = gettingADayInstance.getWeekDay(atMonth: 3, atDay: 13)
        dayLB.text = "\(result)"
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  GrammerTrainning
//
//  Created by SONGYEE SHIN on 2017. 9. 19..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        // UIView
        
        // 클로저 출력
        print(sumResult) //33
        
        //MARK: - 함수의 전달인자로서의 클로저
        let add: (Int, Int) -> Int // 클로저 선언
        add = { (a: Int, b: Int) -> Int in // 클로저 구현부
            return a + b
        }

        let sub: (Int, Int) -> Int
        sub = {(a: Int, b: Int) -> Int in
            return a-b
        }
   
        // 구현부
        func calculate(a:Int, b: Int, method: (Int, Int) -> Int) -> Int {
            return method(a,b)
        }
    
        // 프로퍼티 안에 클로저를 넣기 위해서 쓰는 것.
        var calculation: Int
        
        // 호출
        calculation = calculate(a: 4, b: 4, method: add)
        print(calculation)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


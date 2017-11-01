//
//  ViewController.swift
//  TestCalculator
//
//  Created by SONGYEE SHIN on 2017. 10. 16..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var displayNum: Int = 0
    {
        willSet{
            print(newValue) // 새로운 값이 들어오면 실행될때 알아서 print함수가 불리게 됨!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
       simpleCal(num: 5, op: "S")
       simpleCal(num: 3, op: "+")
       simpleCal(num: 2, op: "/")
       simpleCal(num: 12, op: "S")
       simpleCal(num: 13, op: "%")
    }

    func simpleCal(num: Int, op: String)
    {
//        var number: Int = num
        // 파라미터는 메소드안에서 사용하게 되는데 굳이 쓸 필요가 없음
        
        switch op {
            
        case "S":
           displayNum = num
        case "+":
            displayNum = add(displayNum, num)
        case "-":
            displayNum = sub(displayNum, num)
        case "*":
            displayNum = mul(displayNum, num)
        case "/":
            displayNum = div(displayNum, num)
        
        default:
            print("S,+,-,*,/ 중에서 고르세요~")
        }
    }
    
    // 덧셈
    func add(_ num1: Int, _ num2: Int ) -> Int
    {  // 아규먼트 이름을 쓰기 싫으면 : 와일드카드를 쓰고
        // 메소드 호출시: 아규먼트로 사용됨
        // 메소드 내에: 파라미터를 사용함!
        return num1 + num2
    }
    // 뺼셈
    func sub(_ num1: Int, _ num2: Int ) -> Int
    {
        return num1 - num2
    }
    // 나눗셈
    func div(_ num1: Int, _ num2: Int ) -> Int
    {
//        if num1 == 0
//        {
//           return num1/num2
//        }else{
//
//        }
        var result: Int
        if num2 != 0 {
           result = num1 / num2
        }else{
            result = 0
            // 초기값을 0으로 주면 if문에 안맞는 경우 0으로 결과를 반환!
            // var result: Int = 0
        }
        
        return result
    }
    // 곱셈
    func mul(_ num1: Int, _ num2: Int ) -> Int
    {
        return num1 * num2
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


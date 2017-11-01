//
//  ViewController.swift
//  SubjectCalculatorTest
//
//  Created by youngmin joo on 2017. 10. 11..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //UI
    
    @IBOutlet weak var koreanTF: UITextField!
    @IBOutlet weak var mathTF: UITextField!
    @IBOutlet weak var scienceTF: UITextField!
    @IBOutlet weak var englishTF: UITextField!
    
    @IBOutlet weak var displayLB: UILabel!
    
    // 클래스에서 만든 프로퍼티를 어느 함수에서든지 쓰려고 만듦
    let test: Calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        koreanTF.becomeFirstResponder()
        
        let temp = Calculator()
        let t = temp.totalScore()
        print(t)
        
//          let test: Calculator = Calculator()
//        temp = test.calculator(math: 70, korea: 80, science: 90, english: 80)
        /*
         //        let test: Calculator = Calculator(math: 30, english: 40, korea: 50, science: 60)
         // 값이 없는 상황에서 강제 추출하므로 크러쉬!
         let inputMath: String = mathTF.text!
         let inputEnglish: String = englishTF.text!
         let inputKorea: String = koreanTF.text!
         let inputScience: String = scienceTF.text!
         let test: Calculator = Calculator(math: inputMath, english: inputEnglish, korea: inputKorea, science: inputScience)
         //        temp = test.calculator(math: test1, korea: 60, english: 90, science: 100)
         temp = test.calculator(math: inputMath, korea: inputKorea, science: inputScience, english: inputEnglish)
 
         */
        
//        print(temp)
//      displayLB.text = "\(temp)"
        
    }

    
    @IBAction func getAverageBtn(_ sender: UIButton) {
        //평균 구하기 클릭시 액션
//         displayLB.text = "\(temp)"
        // 옵셔널바인딩
        guard let koreaTFValue: String = koreanTF.text else{return}
        guard let mathTFValue: String = mathTF.text else {return}
        guard let scienceTFValue: String = scienceTF.text else {return}
        guard let englishTFValue: String = englishTF.text else {return}
            
        test.english = Double(englishTFValue)
        test.korea = Double(koreaTFValue)
        test.math = Double(mathTFValue)
        test.science = Double(scienceTFValue)
    
        let result = test.scoreAvg()
        displayLB.text = "\(result)"
        
    }
    
    
    
}


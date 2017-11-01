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
    
    // 과목을 저장할 배열
    var subjectList: [Int] = []
    
    // 계산 클래스 인스턴스
    var test: Calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        koreanTF.becomeFirstResponder()
        
        
    }

    
    @IBAction func getAverageBtn(_ sender: UIButton) {
        //평균 구하기 클릭시 액션
        // 옵셔널바인딩: guard를 쓴 이유: 이 값들 빼서 계속 쓰고 싶어서
        // 문자열에서 Int로 변형할때도 옵셔널바인딩 써야함
        guard let korea = koreanTF.text, let koreaInt = Int(korea) else { return }
        guard let math = mathTF.text,let mathInt = Int(math) else { return }
        guard let science = scienceTF.text,let scienceInt = Int(science) else { return }
        guard let english = englishTF.text, let englishInt = Int(english) else { return }
        
        
        // 배열에 과목을 넣고
        subjectList = [koreaInt,mathInt,scienceInt,englishInt]
       
        var result = test.avgScore(with: subjectList)
        
        displayLB.text = "\(result)"
        
    }
    
}


//
//  Calculator.swift
//  SubjectCalculatorTest
//
//  Created by youngmin joo on 2017. 10. 11..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import Foundation
// 선언부!
class Calculator
{
    
//    let math: Int = 0
//    let english: Int = 0
//    let korea: Int = 0
//    let science: Int = 0

    var math: Double? = 0
    var english: Double? = 0
    var korea: Double?  = 0
    var science: Double? = 0
    // 과목들 점수는 여기서 바뀌지 않으므로
    
    func totalScore() -> Double
    {
        // 총점은 바뀌므로 변수로 선언
        var totalValue: Double = 0.0
        // 옵셔널 바인딩 중첩씀
        if let mathV: Double = math ,let englishV = english,
            let koreaV = korea, let scienceV = science
        {
            totalValue = mathV + scienceV + englishV + koreaV
        } else {print("nil")}
//        if let englishV: String = english{  }
//        if let koreaV = korea { }
//        if let scienceV = science{ }
//        if let totalValue = Double(math + korea + science + english) { }
        
        return totalValue
    }
    
    // 평균 구하는 함수
    func scoreAvg() -> Double {
        return totalScore()/4 //계산된 값을 반환해줌
    }
    
//    init(math: Int,english: Int, korea: Int, science: Int)
//    {
//        self.math = math
//        self.english = english
//        self.korea = korea
//        self.science = science
//    }
//
//    func calculator(math: Int,korea: Int, science: Int, english:Int) -> Double
//    {
//        var resultValue: Double = 0.0
//        resultValue = Double(math+korea+english+science)/4
//
//        return resultValue
//    }
    
}

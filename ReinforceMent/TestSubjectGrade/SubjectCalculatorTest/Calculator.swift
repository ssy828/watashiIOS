//
//  Calculator.swift
//  SubjectCalculatorTest
//
//  Created by youngmin joo on 2017. 10. 11..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import Foundation
class Calculator
{
    // MARK:
//    var resultValue: Int? // 총합을 더할 프로퍼티
    // MARK: -총합메소드: 사용자가 입력할때는 Int형으로 넣어주니까
    func totalScore(with subject:[Int]) -> Int
    {
//        guard let total: Int = resultValue else{return 0}
        var total: Int = 0
        for element in subject
        { // 각 과목에 저장된 점수를 가져옴
            total += element
        }
        
        return total
    }
    func avgScore(with subject:[Int]) -> Double
    {
        var result = totalScore(with: subject) / subject.count
        return Double(result)
    }
}

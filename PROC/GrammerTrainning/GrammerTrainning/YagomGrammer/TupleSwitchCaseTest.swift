//
//  TupleSwitchCaseTest.swift
//  GrammerTrainning
//
//  Created by SONGYEE SHIN on 2017. 10. 3..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import Foundation

class TupleSwitchCaseTest
{
    let tupleValue: (name: String, age: Int) = ("ssy", 27) // String과 Int 타입을 갖는 튜플
    // 함수 안에 조건문 넣어야함 -> 호출을 하려면 메소드 안에서 가능!
    func chk() {
        switch tupleValue{
        case ("ssy", 27) :
            print("정확하게 맞춤!")
        default:
            print("누굴 찾으시나요?")
        }
        
    }
}

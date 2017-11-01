//
//  SetTest.swift
//  GrammerTrainning
//
//  Created by SONGYEE SHIN on 2017. 10. 2..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import Foundation

// 세트: 순서없이 같은 타입의 데이터를 하나의 묶음으로 저장하는 형태
// 세트 내의 값은 모두 유일하고 중복된 값 없음!
class SetTest
{
//    var food: Set<String> = [] // 빈 세트 생성
    // 타입추론할 경우: 배열로 받아들이므로 타입을 명시해줄 것!
    var food: Set<String> = ["송편","유과","송편","약과"] // 순서없이 막 넣어진 것!
    func check()
    {
        print(food.count) // 중복되는 값은 허용되지 않음  // 3이나옴
        food.insert("식혜")
        print(food.count) //4
        
        print(food.remove("송편"))
        print(food.count)
        print(food.sorted()) // 거꾸로 정렬된 배열을 반환함.
        
    }
    
    // set 집합으로 표현
    // 숫자로 집합 만듦
    let a: Set<Int> = [1,3,5,7,9]
    let b: Set<Int> = [1,2,3,4,5,6,7,8,9]
    let c: Set<Int> = [2,4,6,8]
    
    func ck()
    {
        print(c.isDisjoint(with: a)) // 서로 배타적인가요?
        print(a.isSubset(of: b)) // b는 a의 부분집합인가요?
        print(b.isSuperset(of: c)) // b는 c의 전체집한인가요?
    }
}

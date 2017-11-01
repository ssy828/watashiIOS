//
//  DictionaryTest.swift
//  GrammerTrainning
//
//  Created by SONGYEE SHIN on 2017. 10. 2..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import Foundation

// 딕셔너리: 순서없이 키와 값의 쌍으로 구성되는 컬렉션 타입
// 하나의 딕셔너리 안의 키는 유일해야함!! -> 키가 유일한 식별자!!
class DictionaryTest  // 딕셔너리를 배열 안에도 넣을 수 있다!
{
    // 키는 String, 값은 Int타입인 빈 딕셔너리 생성함
    var test1: [String:Int] = [:] // [String:Int]()
    // 딕셔너리 키와 값의 타입이 정확하다면 위처럼 써도 OK!
    // 빈딕셔너리 생성가능!
    
    // 초기값을 주어도 생성 가능!
    var test: [String:Int] = ["태연": 29, "티파니":29, "아이유": 25]
    func check()  {
        print(test.isEmpty) // 빈 딕셔너리인지 확인
        print(test.count) // 딕셔너리가 몇개인지
        
        test["태연"] = 30
        print(test["태연"]!) // 키에 해당하는 값을 불러옴
        print(test.removeValue(forKey: "티파니")!) //removeValue(forKey: ) :  특정키에 해당하는 값을 제거함
        
        print(test.removeValue(forKey: "티파니")!) // 위에서 이미 값을 삭제했으므로 nil 반환
    }
}

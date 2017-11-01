//
//  File.swift
//  GrammerTrainning
//
//  Created by SONGYEE SHIN on 2017. 10. 2..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import Foundation

// 튜플 연습
// 튜플: 타입 이름을 지정하지 않고 프로그래머의 방식으로 만드는 타입
class TupleTest
{ // 이곳은 속성(프로퍼티)과 기능(메소드)를 구현/선언하는 곳!
    
    // 튜플 기본
//    var person:(String,Int,Double) = ("ssy",27,155.3)
    // String과 Int, Double 타입을 갖는 튜플
    var person:(ID:String,Age:Int,Height:Double) = ("ssy",27,155.3)
  // 튜플요소마다 이름을 주는 것이 낫다. 그래야 다른 프로그래머도 보기 쉬움
    func Chek()  {
       // print("이름:\(person.0)") // 인덱스 값을 가져와서 출력가능
      //  person.0 = "mirr"// 인덱스를 통해 값을 할당 가능
        person.Age = 25 // 요소이름을 통해 값을 할당 가능
        person.Age = 27
        print("아이디:\(person.ID)\n나이:\(person.Age)\n키:\(person.Height)")
        
    }

    
}

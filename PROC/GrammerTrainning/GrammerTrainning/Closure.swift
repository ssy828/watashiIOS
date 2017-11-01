//
//  Closure.swift
//  GrammerTrainning
//
//  Created by SONGYEE SHIN on 2017. 9. 20..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import Foundation


// 클로저 기본 문법
/*
    { (매개변수 목록) -> 반환타입 in
        실행코드
    }
 */

// 클로저 사용
// sum이라는 상수에 클로저를 할당
let sum: (Int,Int) -> Int = { (a: Int, b: Int) in
    return a+b
}

let sumResult: Int = sum(11,22)
//print(sumResult) // 33
/////////////////////////////


class sample
{
    // 프로퍼티 안에 클로저를 넣어둠
    let sum = { (a: Int, b: Int) in
        return a+b
    }
    
    // 프로퍼티 접근: 인스턴스를 통해서만 가능!!
    // 프로퍼티 : 객체가 갖는 속성 
    // 예) 색상
    
    // 인스턴스를 생성 ->> 호출 가능!!!
    
    // 하나의 프로퍼티는 하나의 기능만 가능!!!
    /*
        프로퍼티 값을 바꿔주지 않는 이상 계속 그 기능만을 하고 있다
        var x = 10
        
        x = 20 으로 변경해 줄 때까지 10을 저장한 기능만 가지고 있으므로
 
 
    */
    // 클래스 -> 함수 -> 호출
    func sampleFunc()  {
        let sumResult: Int = sum(11,22) // 함수를 안 쓰면 쓸 수 없음
        // 변수 sumResult에 함수호출을 쓴 것
        // 클래스(도면): 함수랑 프로퍼티만 구현!! 호출은 메소드 안에서만 가능!
    }

}









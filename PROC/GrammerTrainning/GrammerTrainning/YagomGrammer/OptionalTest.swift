//
//  OptionalTest.swift
//  GrammerTrainning
//
//  Created by SONGYEE SHIN on 2017. 10. 4..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import Foundation

// 옵셔널 체이닝 예습
class Person
{
    var residence: Residence?
    // residence변수가 Residence 클래스 상속??받음
}

class Residence
{
    var numberOfRooms = 1
}

// 옵셔널 정리
class OptionalTest
{
    // switch를 통한 옵셔널 값 확인
    func checkOptionalValue(value optionalValue: Any?)
    {
        switch optionalValue {
        case .none: // 값이 없는 경우 nil인 경우!
            print("This Optional variable is nil")
        case .some(let value): // 값이 있는 경우
            print("Value is \(value)")
        }
    }
    // 여러 케이스의 조건을 통해 검사 -> where절과 병합해서 사용
    func check()
    {
        let numbers: [Int?] = [2,-4,nil,nil,100]
        for number in numbers {
            switch number{
            case .none:
                print("nil")
            case .some(let value) where value < 0:
                print("Nagative \(value)")
            case .some(let value) where value > 10:
                print("Large \(value)")
            case .some(let value):
                print(value)
            }
        }
    }
    
    // 옵셔널 강제 추출
    func forceUnwrapping()
    {
        let myName: String? = "ssy"
//        var yagom: String = myName! // 옵셔널이 아닌 변수에 옵셔널 값을 넣을 수 없다!!
        // if 조건문 -> 안전하게 처리
        if myName != nil {
            print("My name is \(myName!)") // 값이 없을 수도 있다고 생각해 경고창이 떠서 강제추출 이용!
        }else{
            print("My name is nil ")
        }
    }
    
    // 옵셔널 바인딩 사용한 옵셔널 값 추출
    // 옵셔널 바인딩: nil 체크 + 안전한 값 추출!
    // 옵셔널에 값이 있는지 없는지 확인 할때 사용!
    func printName(_ name: String)  {
        print(name)
    }
    // 옵셔널 바인딩 간단한 예제
    func chkOptinalBinding()
    {
//        let myName: String? = nil // 아무것도 출력안됨
        let myName: String? = "ssy"
        // 이 if let 구문:
        // "myName이라는 상자에 노크해서 값이 있으면 name에 넣어주고 조건문을 실행해줘!"
        if let name = myName{
            printName(_: name) // 다른 함수가 쓸땐 아규먼트를 써줄 것!
            // printName 메소드에서 아규먼트를 와일드카드로 줬기 때문에
        }
    }
  
    
    func optionalBinding()
    {
        let age: Int? = 27 // 이 변수 안에 값이 있을 수도 없을 수도 있다고 명시해줌!
        // Int형이 들어갈 수도 있고 nil이 들어갈 수도 있다.
        // 옵셔널 변수는 초기화하지 않으면 -> nil로 초기화 자동
//        if let value = age{ // age에 값이 있는 경우 value에 저장하고
//            if value >= 20 { // 그 value의 값이 20보다 크면 출력!
//                print("슬프다ㅜㅜ 내나이")
//            }
//        }
        // 위의 로직을 정리한 것이 아래
        if let value = age , value >= 20 {
            // 상수 value에 age 변수가 갖고 있는 값(27)을 저장하고
            // and 상수 value가 20이상일 경우 실행
            print("슬프다")  // 쉼표(,): && 역할!
        
        }
        
    }
}



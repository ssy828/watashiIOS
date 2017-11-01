//
//  TimeinSeconds.swift
//  Trainning
//
//  Created by SONGYEE SHIN on 2017. 9. 22..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import Foundation


// 클래스 -> 선언
class ToolBox {
    
    // var hours: Int  = 0
    // 프로퍼티를 써서 시간 -> 초단위 함수에도 쓰고
    // 초단위 -> 시간 함수에도 쓰면 안될까?????
    // 왜 각각 함수에 선언할까?
    
    // MARK: -시간을 초단위로 계산하는 함수
    func timeToSeconds(number: Int) -> Int
    {
        /*
        var num = number
        let sec = num % 100
        num = num / 100
        let min = num % 100
        let hour = num / 100
        var resultValue: Int = 0
        resultValue = (hour*3600)+(min*60) + sec
        
        return resultValue
        */
        
        let hours = number/10000 // 시간을 받는 변수
        // print(hour)
        let minute: Int = (number/100)%100  // 분을 받는 변수
        // print(minute)
        //  var seconds: Int = minute/10
        let seconds: Int = number%100  // 초단위 저장 변수
        // (number/10)%10 ->5
        // -> 두자리로 나오게 하려면 %100
        // print(seconds)
        var resultValue: Int = 0         // 결과 값
        resultValue = (hours*3600)+(minute*60) + seconds
        // print(resultValue)
        return resultValue
 
    }
    
    
    // 초단위를 시간으로 계산하는 함수
    func secondsToTime(number: Int) -> Int
    {
        var num = number
        let hours: Int = num / 3600
        num = num % 3600
        print(hours)
       //  let minute: Int = (number/60)%60 // 분을 저장할 변수
        let minute: Int = num / 60
        let seconds = num % 60
        //let minute: Int = (number%3600) // 분을 저장할 변수
        print(minute)
        //let seconds: Int = number
        //let seconds: Int = (number%3600)// 초단위
        print(seconds)
        var resultValue: Int = 0 // 결과 값
        resultValue = (hours*10000) + (minute*100) + seconds
        // Int형으로 hhmmss으로 나오게 할려면 십진법으로 자리수에 맞게 하기 위해서
        // 시간에 10000을 곱하고 분에 100을 곱하고 
        // 초는 그래도 두기
        print(resultValue)
        return resultValue
    }
   

    
}

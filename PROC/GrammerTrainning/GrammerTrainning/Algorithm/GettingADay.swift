//
//  GettingADay.swift
//  GrammerTrainning
//
//  Created by SONGYEE SHIN on 2017. 9. 24..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import Foundation

// 요일 구하는 클래스
class GettingAday{
    
    // MARK: - property
    //    var resultValue: Int = 0 // 결과 저장
    
    //MARK: - 월을 받는 메소드 
    // -> 이 함수를 어떤 곳에서 또 쓸지 모르므로
    // String으로 하지말고 Int형으로 반환함.
    
//    func lastDay(month: Int) -> Int
//    {
//        var resultValue: Int = 0 // 결과
//        for element in 1..< month{
//            switch element {
//            case 1,3,5,7,8,10,12:
//                resultValue = 31
//            case 4,6,9,11:
//                resultValue = 30
//            default:
//                resultValue = 28
//                // 2월이 29일인 경우는??... 어떻게 하지??
//            }
//            resultValue += resultValue
//        }
//        return resultValue
//    }
    
    // 월일 구하기
    func lastDay(month: Int, day: Int) -> Int
    {
        var resultValue: Int = 0 // 결과 저장 -> 여기에 쓰면 이 메소드 안에서만 만들어짐
        // var day: Int = 0 // day를 저장
        var dayTemp: Int = 0 // 해당 달 일수를 저장할 임시 변수
        for element in 1..<month {
            if element == 2 {
                // resultValue = 28은 resultValue에 값을 저장하고 다시 temp에 넣으면 계속 같은 수를 더하고 있음
                dayTemp = 28
            }else if element == 4 || element == 6 || element == 9 || element == 11 {
                //  !(month%2 != 0) && !(month%2 == 0)
                    // 조건을 꼭 2개만 하라는 법 없음!! 여러개 가능!!!
                dayTemp = 30
            }else {
                dayTemp = 31
            }
            resultValue += dayTemp
            print(resultValue)
            // resultValue += temp
            // print(resultValue)
            // 계속 리셋됨 resultValue = resultValue + resultValue
            // for이 끝나고 그것을 더한 값
        }
        resultValue += day
        print(resultValue)
        return resultValue
    }
    
    
    // MARK: -요일 구하는 메소드
    func getWeekDay(atMonth: Int, atDay: Int) -> String
    {
        var getWeekDay: String = "" //요일 결과
        var dayArray: [String] = ["일","월","화","수","목","금","토"]
        var sum: Int = 0  // 월을 계산하는 메소드와 day를 합친 값
        var temp: Int = 0// 내가 입력한 일을 모두 더한 값을 일주일로 나눠서 값을 저장할 변수
//        for _ in 1..< atMonth {
//            sum = self.lastDay(month: atMonth)
//        }
//        sum = lastDay(month: atMonth) + day
        sum = lastDay(month:atMonth, day:atDay) // sum에 모든 일수를 저장하고
        temp = (sum%7)-1 // temp에 모든 일수를 7로 나눈 나머지를 인덱스?로 저장
        // 배열은 인덱스가 0부터 시작이므로 -1해줄 것!
        getWeekDay = dayArray[temp] // dayArray에 넣은 배열을 인덱스에 맞게 가져와 getWeekDay에 저장
        return getWeekDay // 그걸 결과를 반환함
    }

   
}


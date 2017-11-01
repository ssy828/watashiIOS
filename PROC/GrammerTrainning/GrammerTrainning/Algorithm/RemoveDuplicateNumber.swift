//
//  RemoveDuplicateNumber.swift
//  GrammerTrainning
//
//  Created by SONGYEE SHIN on 2017. 9. 24..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import Foundation

class RemoveDuplicateNumber {
        
       
          //  displayLb.text = shorter(number: "100223344")
        
        
        // 중복 숫자 줄이기
        
        //    func shorter() -> String {
        //        let numberArray: [String] = ["1","0","0","2","2","3","3","4","2","2"]
        //        for element in numberArray
        //        { // 배열에 저장된 값을 빼고
        //            if compareNumber != element{ // 저장할 대상과 배열에서 뺀 값이 다르면
        //                resultString = resultString + element // 결과 값에 배열에서 뺀 값과 저장
        //            }
        //            compareNumber = element // 배열에서 뺀 값을 비교대상 변수에 넣고 비교를 반복함
        //        }
        //        return resultString // 그게 끝나면 결과값을 반환
        //    }
        
        func shorter(number: String) -> String  {
            // 먼저 출력할 값을 String으로 생각을 함.
            // 함수를 여러번 쓴다는 가정하에 Int로 반환 할 것을 만들어야함
            var compareNumber: String = "" // 비교할 대상을 저장할 변수
            var resultValue: String = "" // 결과를 저장할 변수
            var numberArr: [String] = []
            
            for elementCharacter in number.characters {  // characters : 글자 하나씩 떼서 하기
                numberArr.append(String(elementCharacter))
            }
            for elementArrValue in numberArr{ // numberArr이 담은 값을 하나씩 elementArr에 빼와서
                if compareNumber != elementArrValue { // elementArr에 담은 값과 비교대상이 다를 경우
                    resultValue = resultValue + elementArrValue // 결과 변수에 값을 넣고
                    // resultValue += elementArrValue
                }
                compareNumber = elementArrValue // 다시 elementArrValue값을 비교대상에 넣어 다음 들어올 값과 비교해야하므로
            }
            
            return resultValue
        }
        
        // Int형으로 나오게 해서 하는 방법 생각
        
        
        
    }
    


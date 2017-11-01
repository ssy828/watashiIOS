//
//  LoopTest.swift
//  GrammerTrainning
//
//  Created by SONGYEE SHIN on 2017. 10. 3..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import Foundation


class LoopTest
{
    func chk(){
        
        for i in 0...5{
            if i % 2 == 0 {
                print(i)
                continue // 바로 다음 시퀀스로 건너뜀 // 이걸 안쓰면 여기서 출력되고
            }
            print("\(i) == 홀수") // 여기서 또 한번 출력됨 조건문에 맞는 내용을 2번 출력
        }
    }
    
    func checkCharater()
    {
        var helloswift: String = "Hello"
        for char in helloswift.characters{ // charaters: 글자 하나씩 떼는 메소드
            print(char)
        }
    }

}

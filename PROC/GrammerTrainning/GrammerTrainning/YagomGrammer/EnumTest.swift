//
//  EnumTest.swift
//  GrammerTrainning
//
//  Created by SONGYEE SHIN on 2017. 10. 2..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import Foundation

enum Animal// 클래스와 같은 타입
{ /*
     열거형: 자체가 하나의 테이터 타입!
     구조체, 열거형:  값타입 -> 데이터를 전달할때 값을 복사하여 전달
     => 즉 '사본' // 원본: 그대로 유지!!!
  */
    case tiger
    case leopard  // 각 항목이 그자체가 고유값
    case lion
    
}

enum Animal1: String // 클래스와 같은 타입
{ /*
     열거형: 자체가 하나의 테이터 타입!
     구조체, 열거형:  값타입 -> 데이터를 전달할때 값을 복사하여 전달
     => 즉 '사본' // 원본: 그대로 유지!!!
     */
    case tiger = "A"
    case leopard  // 각 항목이 그자체가 고유값
    case lion
    
}



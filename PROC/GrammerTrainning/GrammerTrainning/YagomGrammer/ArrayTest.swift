//
//  ArrayTest.swift
//  GrammerTrainning
//
//  Created by SONGYEE SHIN on 2017. 10. 2..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import Foundation

class ArrayTest
{
    // 튜플 외에 많은 수의 데이터를 묶어 저장하고 관리가능한 컬렉션 타입 제공
    // 배열: 같은 타입의 데이터를 순서대로 저장하는 컬렉션 타입.
    // 각기 다른 위치에 같은 값이 들어갈 수 있음.
    // 배열 선언과 생성
   
//    var idol: [String] = [] // 스트링 타입의 데이터를 요소로 갖는 빈 배열 생성
    var idol: [String] = ["엑소","소녀시대","방탄소년단","트와이스"] // 인덱스: [0] = "엑소", [1] = "소녀시대"...
    
    func check()  {
        print(idol.count) // .count : idol 배열에 몇개의 요소가 존재하는지 알려줌
        print(idol.isEmpty) // . isEmpty: idol배열이 빈배열인지 확인함 false일경우 빈배열이 아님!
        
        idol.append("레드벨벳") // 레드벨벳을 배열에 추가함
        print(idol.count)
        idol.append(contentsOf: ["워너원","빅스"]) // 맨마지막에 여러개의 데이터를 배열에 추가함
        print(idol.count)
        print(idol.capacity) // capacity:  처음 값에 2배로 미리 배열용량을 계산해놓음 -> 위에서 4개의 데이터를 줘서 두배이니깐 8
        idol.insert("태티서", at: 5) // 인덱스 5번째에 태티서를 삽입함
        print(idol[5],idol[6])
        print(idol.count) // 배열에 8개 데이터있음
//        print(idol.index(of: "레드벨벳")) // 레드벨벳의 인데스 값 출력
        
//        print(idol.first) // 1번째에 있는 인덱스 데이터 출력
//        print(idol.last) // 마지막에 있는 데이터 출력

        // 배열안에 있는 값을 제거
        let removeAt: String = idol.remove(at: 5) // 5번째 인덱스 값을 제거하는 것을 변수에 저장
        print(removeAt)
        print(idol.count) // 하나 없앴으므로 7개가 배열에 있음
        
    }
    
}

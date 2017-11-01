//
//  Enumeration.swift
//  GrammerTrainning
//
//  Created by SONGYEE SHIN on 2017. 9. 19..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import Foundation

// 열거형 -> 정의
// 각 case 그 자체가 고유의 값
enum Weekday: String { // Week 타입 구조체/ 클래스 같은 타입
    
    case mon = "평일" // 고정값을 넣어주려면 위에 타입을 지정해줘야함
    case tue
    case wed
    case thu,fri,sat, sun
    
}

// 원시값 (Raw Value)
// case별로 각각 다른 값을 가져야함
enum Country: String {
    case Japan = "일본"
    case Korea = "한국"
    case Mexico = "멕시코"
    case USA
}
// 원시값을 통한 초기화
// 원시값이 case에 해당하지 않는 경우가 있으므로 원시값을 통해 초기화 한 인스턴스는 옵셔널타입!
// let japan: Country = Country(rawValue: "일본")
let Japan: Country? = Country(rawValue: "일본")

enum Month{
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov
    
    func printMsg() {
        switch self { // Month 타입을 불러오므로
        case .mar, .apr, .may: // mar, apr, may의 타입을 정확히 알고 있으므로 생략
            // 모른다면 Month.mar, Month.apr....
            print("따스한 봄~")
        case .jun, .jul, .aug:
            print("습하고 불쾌지수 높은 여름")
        case .sep, .oct, .nov:
            print("제일 좋아하는 가을!")
        case .dec, .jan, .feb:
            print("추운 겨울!")
        }
    }
}








import Foundation

// 연산 프로퍼티

// MARK: -연산프로퍼티의 정의와 사용
struct CoordiPoint {
    var x: Int
    var y: Int // 저장프로퍼티
    
    // 대칭좌표
    // 연산 프로퍼티
    var oppositePoint: CoordiPoint {
        // 접근자 : 인스턴스 내외부의 값 연산
        get{ // 읽기 전용만 가능!
            return CoordiPoint(x: -x, y: -y)
        }
        
        // 설정자: 내부 프로퍼티 값을 간접적으로 설정
        // 읽기전용일경우: set은 필요 없다!!!!
        set(opppsite){ // 매개변수 생략할경우: newValue로 대신 사용
            x = -opppsite.x // x = -newValue.x
            y = -opppsite.y
        }
        
    }
}


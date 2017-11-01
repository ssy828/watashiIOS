
import Foundation
// 저장프로퍼티 연습

// MARK: -저장프로퍼티 초깃값 지정
struct Coordinate2 {
    var x: Int = 0
    var y: Int = 0 // 저장 프로퍼티
}
class Position2
{
    var point: Coordinate2 = Coordinate2() //저장프로퍼티
    var name: String = "이름없음"
}



// MARK: -저장프로퍼티의 선언& 인스턴스생성
// 구조체
struct CoordinatePoint
{
    // 저장 프로퍼티
    var x: Int
    var y: Int
    // 구조체는 기본적으로 이니셜라이저가 있음
}
// 클래스
class Position
{
    var point: CoordinatePoint
    // 변수 저장 프로퍼티: 위치는 변경가능함!
    let name: String  // 상수 저장 프로퍼티
    // 클래스는 프로퍼티에 기본 값을 설정하지 않으면
    // 이니셜라이저 따로 정의해야함
    init(name: String, point: CoordinatePoint) {
        self.name = name
        self.point = point // self.point: 인스턴스 프로퍼티!
    }
}


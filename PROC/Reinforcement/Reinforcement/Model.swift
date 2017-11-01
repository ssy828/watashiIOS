
import Foundation


class Model
{
    // 프로퍼티
    var time: Int // 시간
    var weekDay: String // 요일
    var textField: String = "" // 텍스트 필드
    var isActivate: Bool // bool타입으로 버튼
    
    init(time: Int, weekDay: String, isActivate: Bool) {
        self.time = time
        self.weekDay = weekDay
        self.isActivate = isActivate
    }
    // 클래스는 상속을 받을 수 있기때문에 이니셜라이저를 해줘야하고
    // 참조타입:
}

//struct ModelStruct {
//    var time: Int
//    var weekDay: String
//    var tf: String = ""
//    var isActivate: Bool
//    // 자동으로 초기화를 만들어내므로
//    // 값 타입: 원본은 건들일 수 없다.!
//}



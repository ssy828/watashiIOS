// 프로퍼티 감시자
import Foundation

class Account
{
    var credit: Int = 0 { // 저장프로퍼티
        willSet{
            print("잔액:\(credit)원 -> \(newValue)원으로 변경예정!!")
        }
        didSet{
            print("\(oldValue)원 -> \(credit)원으로 변경됨")
        }
        
    }
}

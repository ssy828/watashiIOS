
import UIKit

// delegate 이용해보자!
// Delegate 선언부!
class CustomView: UIView {
    
    var delegate: CustomViewDelgate?
    @IBOutlet var LB: UILabel!


//    @IBAction func numberBtn(_ sender:UIButton)
//    {
////        delegate?.numbe(self)
////        // delegate값이 있으면 프로토콜 메소드에
////        // self: customView자신을 넣기
//    }
//
//    @IBAction func clickBtn (_ sender:UIButton)
//    {
//        if sender.
//        {
//            
//        }
//    }
//}

// MARK: -delegate에서 사용할 프로토콜
protocol CustomViewDelgate
{
    // 사칙연산버튼 -> 계산
    func calculator(_ customView: CustomView)
   
    // 숫자버튼 -> 그 값을 저장
    func numberKey(_ cutomview: CustomView)
    
}

//
//  RoundButton.swift
//  MyMusicPlayer
//

import UIKit

class RoundButton: UIButton {
    
    // MARK: 스토리보드에서 사용할때 쓰는 init
    // 스토리보드 코드 : NSCoder
    
    required init?(coder aDecoder: NSCoder)
    {
        // UIButton을 상속받으므로 super!
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 10
      
    }
    
    // 연산프로퍼티와 옵져버 상관 없음!
    // @IBInspectable: inspector에서 해당 인터페이스 요소의 속성을 변경가능하게 하는 것!
    // @IBDesignable: 실시간을 시각적으로 보기 위한 용도
    // 근데 많이 무거워짐
//   @IBInspectable var corner: CGFloat = 0 {
//        didSet {
//            self.layer.cornerRadius = corner
//        }
//    }
    // 연산프로퍼티: get - 그때 값을 set에서 새로 만들때 사용
    
    
}

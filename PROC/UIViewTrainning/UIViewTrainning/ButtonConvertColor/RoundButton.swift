//
//  RoundButton.swift
//  UIViewTrainning
//
//  Created by SONGYEE SHIN on 2017. 9. 27..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

    @IBInspectable var radius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = radius
            // self: UI버튼 인스턴스
            // 레디어스값을 바꿀 때마다 레이어 프로퍼티가 코너레디어스가 입력받은 값을 받는다. 
        }
    }

}

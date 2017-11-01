//
//  CustomView.swift
//  TestDelegate
//
//  Created by SONGYEE SHIN on 2017. 10. 12..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit
// 내가 넣고싶은 기능만 담은 뷰!
// 선언 : 뷰컨트롤러에서 기능을 실행해야하므로
// 기능만 넣기!
class CustomView: UIView {
    // 이곳에 위임자
    var delegate: CustomViewDelegate?
    
    // 레이블
    @IBOutlet var lb: UILabel!
    // 이미지뷰
    @IBOutlet var imageView: UIImageView!
    
    // 스위치: 스위치를 크고 끌때 실행되는 스위치 액션
    @IBAction func switchOn(_ sender: UISwitch) {
        if sender.isOn {
            delegate?.didSwitchOn(self)
            // delegate가 값이 있을경우 켜지는 메소드 사용
            // self: 커스텀뷰의 인스턴스를 넣음
        }else {
            delegate?.didSwitchOff(self)
            // 스위치가 꺼지는 메소드 사용
        }
    }

     // 뷰디드로드같은 역할!
    // 처음부터 캐릭터랑 라벨을 먼저 나타나게 함
        override func awakeFromNib() {
        super.awakeFromNib()
        lb.text = "카카오톡 캐릭터"
        imageView.image = UIImage(named: "카카오톡.jpg")
        imageView.contentMode = .scaleAspectFit

    }
    


}

// 스위치켜고 끌때 이미지랑 글자가 바뀌는?
protocol CustomViewDelegate {
    func didSwitchOn(_ customview: CustomView)
    func didSwitchOff(_ cutomview: CustomView)
}


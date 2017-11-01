//
//  GrammerTestTwoViewController.swift
//  GrammerTrainning
//
//  Created by SONGYEE SHIN on 2017. 10. 7..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit
import Foundation
// MARK: -구조체와 클래스 비교(저장프로퍼티를 이용한)
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

class StoredPropertiesViewController: UIViewController {
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // MARK: -구조체&클래스 비교
        var rangeOfItem: FixedLengthRange = FixedLengthRange(firstValue:0,length:4)
        // var로 선언시: 해당 구조체의 프로퍼티 변경가능!
        rangeOfItem.firstValue = 6
//        rangeOfItem.length = 10 // 오류  // length를 상수로 설정해서
        // let일 경우: 해당 구조체 모든 프로퍼티를 상수로 설정.
//        let rangeOfItem: FixedLengthRange = FixedLengthRange(firstValue: 0, length: 7)
//        rangeOfItem.firstValue = 9
//        rangeOfItem.length = 12
        // 윗부분 아직 의문!
        
        // MARK: -저장프로퍼티의 초깃값 지정 호출
        // 프로퍼티 초기값을 할당시: 파라미터(전달인자)로 초깃값 할당X!
        let ssyPoint2: Coordinate2 = Coordinate2()
        // 당연히 기존에 초깃값을 할당하는 이니셜라이저도 사용가능!
        // let ssyPoint2: Coordinate2 = Coordinate2(x: 10,y: 10)
        print(ssyPoint2.x)
        print(ssyPoint2.y)
        // ssyPoint2.x = 19 값 변경 불가!
        // ssyPoint2 인스턴스를 상수로 지정함
        // 값타입이므로 복사값을 못 바꿈
        
        // 초깃값 지정시 사용자 정의 이니셜라이저 사용하지 않아도 됨
        let ssyPosition2: Position2 = Position2()
        // 상수로 선언해도 값을 바꿀 수 있던 이유
        // 참조 타입이므로 참조값을 바꿔버렸기 때문
        ssyPosition2.name = "ssy"
        ssyPosition2.point = ssyPoint2
        
        print(ssyPosition2.name)
        print(ssyPosition2.point)
        
        
        // MARK: -저장프로퍼티의 선언 및 인스턴스 생성 호출
        let ssyPoint: CoordinatePoint = CoordinatePoint(x: 10, y: 10)
        // 구조체 코디네이트포인트의 인스턴스를 생성하는데 이니셜라이저를 호출하면서 기본값을 설정한 것을 상수 ssyPoint에 할당!
        let ssyPosition: Position = Position(name: "ssy", point: ssyPoint)
        
        print("\(ssyPosition.point) & \(ssyPosition.name)")
        
        
    }

 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

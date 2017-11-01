//
//  ViewController.swift
//  TestDictionary
//
//  Created by SONGYEE SHIN on 2017. 10. 18..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let list1 = ["car1":50,"car2":70,"car3":90]
    let list2 = ["car1":60,"car2":100,"car3":40]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // getMexCount(listDic: list1)
        // getMexCount는 불렀는데 결과값을 저장해서 활용해야 썼다고 할 수 있으므로
        // 변수에 넣어도 print()함수로 찍어야함!!!
        let test = getMexCount(listDic: list1)
        print(test)
        
    }
    
    
    // 높은 수 출력
    func getMexCount(listDic: [String:Int]) -> Int
    {
        // MARK: -내 문제:
        // 딕셔너리를 for_in 구문을 돌려서 (key,value)으로 값을 빼오는 걸 몰랐다!!!
        // 빼온 값을 어떻게 비교하지?
        
        //        var arr: [Int] = []
        // 굳이 배열에 넣을 필요없음. 파라미터를 통해서 유동적으로 개수 사용가능하므로
        //
        var resultValue: Int = 0 // 최종결과 받을 변수
        
        //        guard let car1 = list["car1"] else { return 0 }
        //        guard let car2 = list["car2"] else { return 0 }
        //        guard let car3 = list["car3"] else { return 0 }
        
        // MARK: -for문 이용: 딕셔너리가 순회시: 튜플 사용!
        // 빼와서 하는 걸 모르겠다..키를 어떻게 받아서...
        // 포문에서 값을 가져온다는 걸 까먹음
        for (_,value) in listDic
        {
            // 키값 필요 없다면 ( _,value) 사용!
            // guard문도 필요없음 이미 값을 빼와서 쓰니깐
           
            // MAKR: -비교!!!
            // 이렇게 간단한 걸 생각못함.
            if value > resultValue {
                resultValue = value
            }
        }
        
        // MARK: -max메소드 쓴 것!
        //        guard let maxValue = listDic.values.max() else {return 0}
        //        resultValue = maxValue
    
            // 튜플!
        //        for element in listDic
        //        {
        //            let (key,value) = element
        //
        //        }
        return resultValue
    }
    
}


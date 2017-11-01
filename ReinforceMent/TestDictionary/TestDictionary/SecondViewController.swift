//
//  SecondViewController.swift
//  TestDictionary
//
//  Created by SONGYEE SHIN on 2017. 10. 19..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    let list1_str = [
        "car1":"50",
        "car2":"70",
        "car3":"90"
    ]
    let list2_str = ["car1":"30","car2":"10","car3":"50"]
   
    // 전체 딕셔너리 안에 car1키의 값: 딕셔너리로 들어가 있는 구조
    let list3 = [
        "car1": ["name":"SM3","score":30],
        "car2": ["name":"SM5","score":60],
        "car3": ["name":"SM7","score":10],
        "car4": ["name":"SM9","score":100]
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let test = getMaxCount2(list: list2_str)
        print(test)
        
        let test2 = getMaxCarName(list: list3)
        print(test2)
    }
    
    //높은 수 출력
    func getMaxCount2(list:[String:String]) -> Int
    {
        var resultValue: Int = 0
        for (_,value) in list
        {
            guard let valueInt: Int = Int(value) else {return 0}

            if resultValue < valueInt
            {
                resultValue = valueInt

            }

        }
        // MARK: -max 사용해서 쓰는 법
//        guard let value: String = list.values.max() else {return 0}
//        guard let valueInt: Int = Int(value) else { return 0}
//        resultValue = valueInt
        
        return resultValue
    }
    
    //카 이름 리턴
    func getMaxCarName(list:[String:Any]) -> String
    {
        var result: String = ""
        var compareValue: Int = 0// 값 비교할 대상
//        var resultDic: [String]
       
        // 값을 꺼내고
        for (_,value) in list{
        // 다운 캐스팅 해준다.Any에서 딕셔너리로
//            guard let valueDic = value as? [String:Any],
//                let finalValue = valueDic as?  else { return "nil"}
//            result = finalValue
            guard let valueDictionary = value as? [String: Any] else { return "nil" }
            if let score = valueDictionary["score"] as? Int {
                if compareValue < score{
                    compareValue = score
                }
                // 최대 score찾기
//                valueDictionary["name"] as? String
            }
        }
        return result
    }
    
    
}


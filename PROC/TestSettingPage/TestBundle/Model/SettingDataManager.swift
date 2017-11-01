//
//  SettingModel.swift
//  TestBundle
//
//  Created by SONGYEE SHIN on 2017. 10. 23..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import Foundation

class SettingManager
{
    // 싱글턴패턴
    static var one: SettingManager = SettingManager()
    
    var settings:[SettingData] = []
    
    // 위의 거와 같음
    // 연산프로퍼티 : 어디선가 프로파일매니저 인스턴스가
    // 프로파일 프로퍼티에 담긴 데이터를 반환해주는 것
    var settingData:[SettingData]{ // 프로파일 데이터: 프로파일모델타입의 묶음(배열)
        return settings // get만 사용: get{} 생략가능!
    }
    
    init()
    {
       loadData() //프로파일데이터매니저 인스턴스가 생성될 때(초기화되면서)호출
    }
    
    func loadData()
    {
        // 1. 번들에 있는 것을 가져오고
        guard let basePath = Bundle.main.path(forResource: "Settings", ofType: "plist") else { return }
        
        // 2. 번들에서 가져온 값을 배열로 만들어주고
        // -> 설정모델 데이터 처음 들어가는 [ [String: Any] ]딕셔너리타입을 가진 배열로 타입캐스팅
        guard let list = NSArray(contentsOfFile: basePath) as? [[String: Any]] else { return }
        
        // 3. 딕셔너리를 담은 배열 list에서 딕셔너리타입 element를 하나씩 빼와서
        // 값이 있다면 SettingData타입의 빈배열인 settings에 추가!
        for element in list
        {
            // SettingData의 이니셜라이저의 파라미터가
            // element를 통해서 만든 인스턴스를
            // newElement에 할당
            if let newElement = SettingData(dataDic: element)
            {
                self.settings.append(newElement)
            }
        }
    }
    
}


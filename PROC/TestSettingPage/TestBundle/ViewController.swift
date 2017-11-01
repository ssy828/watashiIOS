//
//  ViewController.swift
//  TestBundle
//
//  Created by SONGYEE SHIN on 2017. 10. 23..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 번들에있는 경로를 가져오고
        guard let basepath = Bundle.main.path(forResource: "Settings", ofType: "plist") else {return}
        // 번들에서 가져온 값을 배열로 만듦
//        guard let list = NSArray(contentsOfFile: basepath) as? [Any] else {return}
//        print(list)
 
        if let list = NSArray(contentsOfFile: basepath) as? [Any]
        {
            print(list)
        }
        
        // 다큐먼트에 번들에 있는 것을 복사
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        // path[0] : 여기까지가 Document이고
        // 거기에 plist 파일 추가
        let basePath = path[0]+"/Settings.plist"
        print(basePath)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


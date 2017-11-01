//
//  ViewController.swift
//  calculation(Me)
//
//  Created by SONGYEE SHIN on 2017. 9. 15..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CustomViewDelgate {
    
   @IBOutlet var newLb: CustomView!
    // 커스텀뷰랑 연결할 인스턴스 필요!
    // 뷰컨트롤러(루트뷰)위에 올려야하므로
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func calculator(_ customView: CustomView)
    {
        
    }
    
    func numberSaveTheValue(_ cutomview: CustomView)
    {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  SettingScreen
//
//  Created by SONGYEE SHIN on 2017. 10. 22..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var emailData: NSMutableArray = ["title","long title","long long long long text","long long long long long long long long long text"]
    
    @IBOutlet weak var emailTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTableView.rowHeight = UITableViewAutomaticDimension
        // 테이블 뷰의 셀의 높이에 자동으로 지정된 값으로 할당
        
    }
    
    // 텍스트값 그대로 나오게 하기 위한 메소드
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    // 열의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return 20
        return emailData.count
    }
    // 열의 크기 다시 지정해도 됨
    
    
    // 셀을 어떻게 표현할지 구성하는 부분
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = emailTableView.dequeueReusableCell(withIdentifier: "EmailCell", for: indexPath) as! MyCell
        cell.contentLb.text = emailData[indexPath.row] as? String
        // emailDat 배열의 인덱스의 row를 값이 있다면 String타입으로 가져온다!
        return cell
    }

}


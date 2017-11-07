//
//  ListTableViewController.swift
//  MyMusicPlayer
//
//  Created by SONGYEE SHIN on 2017. 11. 5..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var gender: UISegmentedControl!
    
    @IBOutlet weak var Job: UISwitch!
    
    @IBAction func changeGender(_ sender: UISegmentedControl) {
    }
    @IBAction func changeJob(_ sender: UISwitch) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

   

    
}

// MARK: - Table view data source
extension ListTableViewController
{
    // 자식 클래스에서 메소드가 구현되어있지 않으면 동일한 부모메소드가 호출되는 객체 지향 특성을 이용하는 것으로
    // 현재는 필요 없다.
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        // 부모 클래스 메소드 호출 그 결과를 반환!
//        return super.numberOfSections(in: tableView)
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        // 전달받은 인자값을 사용 -> 부모클래스의 메소드 호출
//        // 그 결과값을 받아 반환!
//        return super.tableView(tableView, numberOfRowsInSection: section)
//    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0
        {
            let alert = UIAlertController(title: nil, message: "이름을 입력하세요!", preferredStyle: UIAlertControllerStyle.alert)
            // 입력 필드 추가
            alert.addTextField(){
                $0.text = self.name.text
                // 텍스트필드 객체에 입력된 텍스트 값에 name레이블의 텍스트를 넣어줌
            }
            // 버튼 및 액션 추가
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (_) in })
                // 사용자가 ok버튼 클릭시 입력 필드에 입력된 값을 저장
            
                // 알림창 띄움
                self.present(alert, animated: false, completion: nil)
            
        }
    }
}

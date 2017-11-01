//
//  ListViewController.swift
//  CHAPTER05
//
//  Created by SONGYEE SHIN on 2017. 10. 22..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {

    // 이름적히는 라벨
    @IBOutlet weak var nameLb: UILabel!
    
    @IBOutlet weak var gender: UISegmentedControl!
    
    @IBOutlet weak var hasJob: UISwitch!
    
  
    
    // 두 메소드 액션 메소드: 사용자가 클릭하여 값이 변경되면 그 값을 UserDefualt 객체 저장하기 위해서 만듦
    @IBAction func changeGender(_ sender: UISegmentedControl)
    { // 데이터 저장
        let value = sender.selectedSegmentIndex // 0 -남자 1- 여자
        
        let plist = UserDefaults.standard // 기본 저장소 객체를 가져옴
        
        plist.set(value, forKey: "gender")//gender라는 키로 값을 저장
        plist.synchronize() // 동기화 처리: 양쪽데이터 일치 시켜줘야함!
        // UserDefault에 데이터를 저장한 후에 반드시 캐싱된 데이터 갱신해야하므로
        
    }
    @IBAction func changeJob(_ sender: UISwitch)
    {
        let value = sender.isOn // true - 직장있음
        
        let plist = UserDefaults.standard
        plist.set(value, forKey: "hasJob")
        plist.synchronize()
        
    }
    
    
    // 이름 편집 기능 구현 메소드
    // UILbel: 액션 메소드 연결불가! 직접 값을 입력불가!
    // 텍스트필드: 사용자가 여러개의 문자를 지속적으로 입력하는 방식(저장버튼과 함께 사용해야 하는 컨트롤)
    // tableView(_:didSelectRowAt:)메소드
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        // tableView: UITableView: 어느 테이블 뷰가 호출 됐어?(호출한 테이블 뷰에 대한 정보)
        // didDeselectRowAt indexPath: IndexPath: 어느 셀을 선택했어?(선택된 셀에 대한 정보)
        if indexPath.row == 1 { // 0이 아닌 걸까?
            // 1번째 셀만 선택시: 입력이 가능한 알림창을 띄워 이름 수정가능하게 함
            let alert = UIAlertController(title: nil, message: "이름을 입력하세요", preferredStyle: UIAlertControllerStyle.alert)
            // title: nil?? 왜?
            
            // 입력 필드 추가
            alert.addTextField(){
                $0.text = self.nameLb.text
                // name레이블의 텍스트를 입력폼에 기본 값으로 넣어줌
                // $0: 텍스트 필드의 객체
                // $0.text: 텍스트 필드에 입력된 텍스트 값
                
            }
            // 버튼 및 액션 추가
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default){ (_) in
                
                // 사용자가 OK버튼을 누르면 입력 필드에 입력된 값을 저장
                let value = alert.textFields?[0].text
                
                let plist = UserDefaults.standard // 기본 저장소를 가져온다
                plist.setValue(value, forKey: "name")
                plist.synchronize() // 동기화 처리
                
                // 수정된 값을 이름 레이블에 적용
                self.nameLb.text = value
            })  // 입력된 값을 저장하는 과정 끝
            
            // 알림창을 띄운다.
            self.present(alert, animated: false, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return super.numberOfSections(in: tableView)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        // 부모 클래스에 정의된 메소드 이용하면 테이블 뷰의 행 개수를 처리하는데 문제 없다!
        return super.tableView(tableView, numberOfRowsInSection: section)
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

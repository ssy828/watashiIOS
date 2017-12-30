//
//  ViewController.swift
//  TestTableView


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var testList = ["A","B","C","???????","oHHHHHHHHHHHHHHHHHHH"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // tableFooterView를 정의.
//        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 10))
        let footerView = UIView(frame: CGRect.zero)
        // footerView가 화면에 보이지 않게 배경을 투명으로 설정
        footerView.backgroundColor = UIColor.clear
        // tableFooterView 설정
        tableView.tableFooterView = footerView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate {
    
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        cell.testLabel.text = testList[index]
        return cell
    }
    
    
}
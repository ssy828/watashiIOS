//
//  ViewController.swift
//  TestTableView

import UIKit

// MARK: - Class SettingsViewController
class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var testList = ["A","B","C","???????","oHHHHHHHHHHHHHHHHHHH"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTableFooterView()
        self.registerXib(tableView)
    }
    
    
    private func setUpTableFooterView() {
        // tableFooterView를 정의.
        let footerView = UIView(frame: CGRect.zero)
        // footerView가 화면에 보이지 않게 배경을 투명으로 설정
        footerView.backgroundColor = UIColor.clear
        // tableFooterView 설정
        tableView.tableFooterView = footerView
    }
    
    public func registerXib(_ tableView: UITableView) {
        let xibName = UINib(nibName: "LabelTableViewCell", bundle: nil)
        tableView.register(xibName, forCellReuseIdentifier: "Cell")
    }
}
// MARK: - UITableViewDelegate
extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 2:
            let licenseTVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LicenseTable")
            self.navigationController?.pushViewController(licenseTVC, animated: true)
        default:
            break
        }
    }
}
// MARK: - UITableViewDataSource
extension SettingsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! LabelTableViewCell
        cell.titleLB.text = testList[index]
        return cell
    }
    
}

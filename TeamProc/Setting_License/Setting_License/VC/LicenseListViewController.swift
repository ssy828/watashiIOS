//
//  LicenseListViewController.swift
//  Setting_License

import UIKit
// MARK: - class LicenseListViewController
class LicenseListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let settingInstance = SettingsViewController()
    let licenseTitleList = ["가나다","라마바","사아자"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settingInstance.registerXib(tableView)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
// MARK: - UITableViewDelegate
extension LicenseListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let licenseVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LicenseVC")
        self.navigationController?.pushViewController(licenseVC, animated: true)
    }
}
    // MARK: - UITableViewDataSource
extension LicenseListViewController: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return licenseTitleList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let index = indexPath.row
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! LabelTableViewCell
            cell.titleLB.text = licenseTitleList[index]
            return cell
        }
}


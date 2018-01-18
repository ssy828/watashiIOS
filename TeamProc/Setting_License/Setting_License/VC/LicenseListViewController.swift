
//  LicenseListViewController.swift
//  Setting_License

import UIKit
// MARK: - class LicenseListViewController
class LicenseListViewController: UIViewController {
    
    // MARK: property
    private let settingInstance = SettingsViewController()
    let licenseInstance = LicenseViewController()
    private let licenseTitleList = ["가","라바","사"]
    private let addressList = ["https://github.com/onevcat/Kingfisher","https://github.com/patchthecode/JTAppleCalendar"]
    // MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settingInstance.registerXib(tableView)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        if segue.identifier == "GoToLicenseVC" {
        //            let indexPaths = self.tableView!.indexPathForSelectedRow
        //            let indexPath = indexPaths[0] as NSIndexPath
        //            let vc = segue
        //        }
    }
    
}
// MARK: - UITableViewDelegate
extension LicenseListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        let licenseVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LicenseVC")
        self.performSegue(withIdentifier: "GoToLicenseVC", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
        licenseVC.navigationItem.title = licenseTitleList[index]
    }
}
// MARK: - UITableViewDataSource
extension LicenseListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return licenseTitleList.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! LabelTableViewCell
        cell.titleLB.text = licenseTitleList[index]
        return cell
    }
    
}


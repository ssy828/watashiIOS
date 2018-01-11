
//  LicenseListViewController.swift
//  Setting_License

import UIKit
// MARK: - class LicenseListViewController
class LicenseListViewController: UIViewController {
    
    // MARK: property
    private let settingInstance = SettingsViewController()
    private let licenseTitleList = ["가","라바","사"]
    private let addressList = ["https://github.com/onevcat/Kingfisher","https://github.com/patchthecode/JTAppleCalendar"]
    weak var delegate: LicenseListViewControllerDelegate?
    // MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settingInstance.registerXib(tableView)
    }
    
}
// MARK: - UITableViewDelegate
extension LicenseListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
        let licenseVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LicenseVC")
        self.navigationController?.pushViewController(licenseVC, animated: true)
        licenseVC.navigationItem.title = licenseTitleList[index]
        self.delegate?.sendAddress(of: addressList[index])
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

protocol LicenseListViewControllerDelegate: class {
    func sendAddress(of githubAddress: String)
}

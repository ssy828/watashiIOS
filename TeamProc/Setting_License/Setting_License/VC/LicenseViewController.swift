//
//  LicenseViewController.swift
//  Setting_License

import UIKit

class LicenseViewController: UIViewController {
    
    @IBOutlet weak var licenseTextView: UITextView!
    let licneseInstance = License()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        let _ = licneseInstance.makeSentenceOfLicense("https://github.com/onevcat/Kingfisher", licenseTextView)
    }
   
}

extension LicenseViewController: LicenseListViewControllerDelegate {
    func sendAddress(of githubAddress: String) {
       let _ = licneseInstance.makeSentenceOfLicense(githubAddress, licenseTextView)
    }
    
}


//
//  LicenseViewController.swift
//  Setting_License

import UIKit

class LicenseViewController: UIViewController {
    
    @IBOutlet weak var licenseTextView: UITextView!
    var test: String?
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //        let _ = licneseInstance.makeSentenceOfLicense("https://github.com/onevcat/Kingfisher", licenseTextView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.licenseTextView.text = test
    }
    

}



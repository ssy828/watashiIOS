//
//  HeaderSection.swift
//  PopView

import UIKit

class HeaderSection: UITableViewHeaderFooterView {

    @IBOutlet weak var dateLB: UILabel!
    @IBAction func close(_ sender: UIButton) {
        self.removeFromSuperview()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

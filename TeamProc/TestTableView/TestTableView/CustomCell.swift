//
//  CustomCell.swift
//  TestTableView
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var testLabel: UILabel!

    // MARK: When Cell loads
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutIfNeeded()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

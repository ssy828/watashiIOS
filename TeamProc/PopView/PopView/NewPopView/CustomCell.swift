//
//  CustomCell.swift
//  PopView

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var contentLB: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  EmptyCell.swift
//  PopView

import UIKit

class EmptyCell: UITableViewCell {

    @IBAction func writingPost(_ sender: UIButton){
        print("AHHHHHH")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

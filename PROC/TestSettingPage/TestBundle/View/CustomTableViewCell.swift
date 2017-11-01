//
//  CustomTableViewCell.swift
//  TestBundle
//
//  Created by SONGYEE SHIN on 2017. 10. 24..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    var data: SettingData?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

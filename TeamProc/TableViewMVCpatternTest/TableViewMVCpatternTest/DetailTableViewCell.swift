//
//  DetailTableViewCell.swift
//  TableViewMVCpatternTest
//
//  Created by SONGYEE SHIN on 2017. 12. 13..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView?
    @IBOutlet weak var nameLB: UILabel?
    @IBOutlet weak var postDateLB: UILabel?
    @IBOutlet weak var titleLB: UILabel?
    @IBOutlet weak var previewLB: UILabel?
    
    class var identifier: String{
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(item: DetailModelItem) {
        nameLB?.text = item.name
        postDateLB?.text = item.date
        titleLB?.text = item.title
        previewLB?.text = item.preview
    }
}

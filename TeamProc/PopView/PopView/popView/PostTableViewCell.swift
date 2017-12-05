//
//  PostTableViewCell.swift
//  PopView


import UIKit
import SnapKit

class PostTableViewCell: UITableViewCell {

    let testLB: UILabel = {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 0.6898184419, green: 0.6422915459, blue: 0.9986525178, alpha: 1)
       return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.addSubview(testLB)
        testLB.snp.makeConstraints {
            $0.width.equalTo(self)
            $0.height.equalTo(self)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
 
}

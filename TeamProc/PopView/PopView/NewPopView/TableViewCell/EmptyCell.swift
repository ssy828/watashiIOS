//
//  EmptyCell.swift
//  PopView

import UIKit

class EmptyCell: UITableViewCell {

    var completion: (() -> Void)?
    
    @IBAction func writingPost(_ sender: UIButton){
//        let point = sender.superview?.convert(sender.center, to: self)
//        if let indexPath = self.indexPathForRow(at: point!) {
//            //pass indexPath as sender with performSegue
//            self.performSegue(withIdentifier: "showDetail", sender: indexPath)
//        }
        
        completion?()
        
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

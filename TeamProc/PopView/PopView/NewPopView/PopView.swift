//
//  PopView.swift
//  PopView

import UIKit
import SnapKit

class PopView: UIView {
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var dateLB: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBAction func close(_ sender: UIButton){
        self.removeFromSuperview()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit( ){
        Bundle.main.loadNibNamed("PopView", owner: self, options: nil)
        self.addSubview(baseView)
        baseView.frame = self.bounds
        baseView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        self.baseView.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
}



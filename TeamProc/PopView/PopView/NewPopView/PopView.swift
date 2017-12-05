//
//  PopView.swift
//  PopView

import UIKit
import SnapKit

class PopView: UIView{
    
    // MARK: IBOutlet
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var dateLB: UILabel!
    @IBOutlet weak var tableView: UITableView!
    // MARK: IBAction
    @IBAction func close(_ sender: UIButton){
        self.removeFromSuperview()
    }
    // MARK: awakeFromNib()
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    // 코드
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    // 스토리보드
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    // MARK: commonInit()
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

// MARK: UITableViewDataSource
extension PopView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        return cell
    }
    
}

// MARK:
extension PopView: UITableViewDelegate {
    
}


//
//  PopView.swift
//  PopView

import UIKit
import SnapKit

class PopView: UIView{
    var testList: [String] = ["cat","puppy","red","yellow","blue~~~"]
    // MARK: IBOutlet
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var dateLB: UILabel!
    @IBAction func close(_ sender: UIButton) {
        contentView.isHidden = true
    }
    var isLoading: Bool = false
    
    // MARK: awakeFromNib()
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.register(UINib.init(nibName: "EmptyCell", bundle: nil), forCellReuseIdentifier: "EmptyCell")
        contentView.isHidden = true
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
        self.contentView.addSubview(tableView)
        
    }
    
}


// MARK: UITableViewDataSource
extension PopView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = testList.count
        return (isLoading) ?  0 : (count > 0) ? count : 1
//        return testList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch testList.count {
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath)
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let index = indexPath.row
            if let cell = cell as? CustomCell {
               cell.contentLB.text = testList[index]
            }
            return cell
        }
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
//        return cell
    }
    
}

// MARK: UITableViewDelegate
extension PopView: UITableViewDelegate {
    
}


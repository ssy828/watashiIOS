//
//  PopView.swift
//  PopView

import UIKit
import SnapKit

class PopView: UIView{
    
    // MARK: IBOutlet
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var tableView: UITableView!
    var isLoading: Bool = false
    
 
    // MARK: awakeFromNib()
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.register(UINib.init(nibName: "EmptyCell", bundle: nil), forCellReuseIdentifier: "EmptyCell")
        tableView.register(UINib.init(nibName: "HeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "HeaderSection")
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
    }
}

// MARK: UITableViewDataSource
extension PopView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return (isLoading) ?  0 : (count > 0)? count : 1
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        return cell
    }
    
}

// MARK: UITableViewDelegate
extension PopView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderSection") as! HeaderSection
        headerView.dateLB.text = "2017년 12월 6일"
        return headerView
    }
}


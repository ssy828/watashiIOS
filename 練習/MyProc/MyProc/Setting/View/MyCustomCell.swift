

import UIKit

// MARK: - Cell 
class MyCustomCell: UITableViewCell {

    
    @IBOutlet weak var vesionLb: UILabel!   
    var data: SettingModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // 뷰가 먼저 생성되기 전에 준비해놓음
        // 레이블이 전체 셀에 보여지므로 그것을 방지차원에
        // 미리 숨기고 시작해 특정 셀에서만 보여지기 위해 
        vesionLb.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: -버전표시
    func showVersion() -> String
    {
        guard let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String else{ return "nil"}
        
        return version
    }
    
}

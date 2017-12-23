import UIKit

class TodayReusableView: UICollectionReusableView {
  
  // MARK: Property
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  
  
  // MARK: Life Cycle
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  // MARK: - Configure
  func configure(for headerData: Todays) {
    titleLabel.text = headerData.title
    dateLabel.text = headerData.dateTitle
  }
  
}

import UIKit

class TodayCell: UICollectionViewCell, ViewRoundable {
  
  // MARK: Property
  @IBOutlet weak var categoryTitleLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    roundRadius = 10
  }
  
  // MARK: Configure
  func configure(for cellData: Today) {
    titleLabel.text = cellData.title
    categoryTitleLabel.text = cellData.subTitle
    imageView.image = UIImage(named: cellData.imageName)
  }
  
}

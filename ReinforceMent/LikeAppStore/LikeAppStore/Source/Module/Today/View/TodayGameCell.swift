import UIKit

class TodayGameCell: UICollectionViewCell, ViewRoundable {
  
  // MARK: Property
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var mainImageView: UIImageView!
  @IBOutlet weak var avartorImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    roundRadius = 10
  }
  
  
  // MARK: - Configure
  func configure(for cellData: Today) {
    titleLabel.text = cellData.title
    mainImageView.image = UIImage(named: cellData.imageName)
    avartorImageView.image = UIImage(named: cellData.avatarImageName)
  }
  
}

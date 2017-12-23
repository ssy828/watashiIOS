import UIKit

class TodayDetailViewController: UIViewController {

  // MARK: Property
  
  @IBOutlet weak var mainImageView: UIImageView!
  @IBOutlet weak var categoryTitleLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  
  var todayModel: Today?
  
  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
  }
  
}

// MARK: - SetupView
extension TodayDetailViewController {
  
  private func setupView() {
    
    guard let today = todayModel else { return }
    mainImageView.image = UIImage(named: today.imageName)
    categoryTitleLabel.text = today.subTitle
    titleLabel.text = today.title
  }
}

// MARK: - Actions
extension TodayDetailViewController {
  
  @IBAction private func didTapExitButton(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
  
}

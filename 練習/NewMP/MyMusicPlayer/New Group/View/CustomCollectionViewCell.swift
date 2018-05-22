
import UIKit

// MARK: 커스텀셀
// 레이블 / 이미지를 셀 안에 뒀으므로 셀에서 관리
// 뷰컨트롤러에 주면 뷰와 데이터가 직접적으로 주고받는 경우가 되버림
class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var artistLb: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
}

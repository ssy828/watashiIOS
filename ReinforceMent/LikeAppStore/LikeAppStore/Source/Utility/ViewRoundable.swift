import UIKit

protocol ViewRoundable: class {
  
  var roundRadius: CGFloat { get set }
}

// MARK: - Related UICollectionViewCell 
extension ViewRoundable where Self: UICollectionViewCell {
  
  var roundRadius: CGFloat {
    get {
      return self.layer.cornerRadius
    }
    set {
      layer.cornerRadius = newValue
    }
  }
}

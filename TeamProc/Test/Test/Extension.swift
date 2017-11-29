
import UIKit

// MARK: UIAlertCotroller
extension UIAlertController {
    static func presentAlertController(target: UIViewController,
                                       title: String?,
                                       massage: String?,
                                       actionStyle: UIAlertActionStyle = UIAlertActionStyle.default,
                                       cancelBtn: Bool,
                                       completion: ((UIAlertAction)->Void)?)
    {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: actionStyle, handler: completion)
        alert.addAction(okAction)
        if cancelBtn {
            let cancelAction = UIAlertAction(title: "취소", style: actionStyle, handler: completion)
            alert.addAction(cancelAction)
        }
        target.present(alert, animated: true, completion: nil)
    }
}

// MARK: UIView
extension UIView {
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func dropShadow(scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 1
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}




import UIKit

extension UIView {
  
  var frameWidth: CGFloat {
    get { return self.frame.size.width }
    set { self.frame.size.width = newValue }
  }
  
  var frameHeight: CGFloat {
    get { return self.frame.size.height }
    set { self.frame.size.height = newValue }
  }
  
  var boundsWidth: CGFloat {
    get { return self.bounds.size.width }
    set { self.bounds.size.width = newValue }
  }
  
  var boundsHeight: CGFloat {
    get { return self.bounds.size.height }
    set { self.bounds.size.height = newValue }
  }
  
  var top: CGFloat {
    get { return self.frame.origin.y }
    set { self.frame.origin.y = newValue}
  }
  
  var left: CGFloat {
    get { return self.frame.origin.x }
    set { self.frame.origin.x = newValue}
  }
  
  var bottom: CGFloat {
    get { return self.top + self.frameHeight }
    set { self.top = newValue - self.frameHeight }
  }

  var right: CGFloat {
    get { return self.left + self.frameWidth }
    set { self.left = newValue - self.frameWidth }
  }
  
  
}

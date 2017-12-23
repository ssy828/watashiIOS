
import Foundation
import UIKit

@objc protocol KeyboardRespondable: class {
  
  var scrollView: UIScrollView { get }
  
}

extension KeyboardRespondable where Self: UIViewController {
  
//  func addKeyboardNotification() {
//    NotificationCenter.default
//      .addObserver(self,
//                   selector: #selector(keyboardWillShow(_:)),
//                   name: .UIKeyboardWillShow,
//                   object: nil)
//    NotificationCenter.default
//      .addObserver(self,
//                   selector: #selector(keyboardWillHide(_:)),
//                   name: .UIKeyboardWillHide,
//                   object: nil)
//  }
  
}



//extension UIViewController: KeyboardRespondable {
//
//  var scrollView: UIScrollView {
//    return UIScrollView()
//  }
//  func addKeyboardNotification() {
//    NotificationCenter.default
//      .addObserver(self,
//                   selector: #selector(keyboardWillShow(_:)),
//                   name: .UIKeyboardWillShow,
//                   object: nil)
//    NotificationCenter.default
//      .addObserver(self,
//                   selector: #selector(keyboardWillHide(_:)),
//                   name: .UIKeyboardWillHide,
//                   object: nil)
//  }
//
//  @objc func keyboardWillHide(_ notification: Notification) {
//
//  }
//  @objc func keyboardWillShow(_ notification: Notification) {
//
//  }
//
//}


//extension KeyboardRespondable {
//
//  func addKeyboardNotification() {
//    NotificationCenter.default
//      .addObserver(self,
//                   selector: #selector(keyboardWillShow(_:)),
//                   name: .UIKeyboardWillShow,
//                   object: nil)
//    NotificationCenter.default
//      .addObserver(self,
//                   selector: #selector(keyboardWillHide(_:)),
//                   name: .UIKeyboardWillHide,
//                   object: nil)
//  }
//
//  func keyboardWillShow(_ notification: Notification) {
//    guard let info = notification.userInfo else { return }
//    guard let keyboardFrame = info[UIKeyboardFrameEndUserInfoKey] as? CGRect else { return }
//    scrollView.contentInset.bottom = keyboardFrame.height
//  }
//  func keyboardWillHide(_ notification: Notification) {
//
//  }
//}




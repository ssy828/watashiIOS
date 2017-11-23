//
//  ExtensionKeyboard.swift
//  TestInstaGram


import UIKit

extension Notification {
    var keyboardHeight: CGFloat? {
        guard let userInfo = userInfo else { return nil }
        guard let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else { return nil }
        return keyboardFrame.height
    }
}

extension UIScrollView {
    func handleKeyboardShow(keyboardHeight: CGFloat, visibleTarget: CGRect){
        contentInset = UIEdgeInsets(top: -keyboardHeight, left: 0, bottom: 0, right: 0)
        scrollIndicatorInsets = contentInset
        
        //scrollRectToVisible(visibleTarget, animated: true)
    }
}

//
//  Extension.swift
//  PopView

import UIKit

extension UIViewController {
    
    // MARK: 뷰띄우기
    func popUpView() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissView))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissView() {
        view.endEditing(true)
    }
}

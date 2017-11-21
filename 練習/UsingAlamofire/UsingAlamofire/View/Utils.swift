//
//  Utils.swift
//  UsingAlamofire
import Foundation
import UIKit

// 알림창
extension UIViewController{
    
    func alert(_ message: String, completion: (()->Void)? = nil)
    {
        // 메인 스레드에서 실행되도록
        DispatchQueue.main.async {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.cancel, handler: { _ in
                completion?() // completion 매개변수의 값이 nil이 아닐때에만 실행되도록
            })
            alert.addAction(okAction)
            self.present(alert, animated: false, completion: nil)
        }
    }
}

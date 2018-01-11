//
//  LicenseViewController.swift
//  Setting_License

import UIKit

class LicenseViewController: UIViewController {
    
    @IBOutlet weak var licenseTextView: UITextView!
    
    private let licenseTitleList = ["가나다","라마바","사아자"]
    
    private let text = """
    The MIT License (MIT)
    Copyright (c) 2018 Wei Wang
    (https://github.com/onevcat/Kingfisher)

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
    """
    func testString() {
        let attributeString = NSMutableAttributedString(string: text)
        attributeString.addAttribute(.link, value: "https://github.com/onevcat/Kingfisher", range: NSString(string: text).range(of: "https://github.com/onevcat/Kingfisher"))
        licenseTextView.attributedText = attributeString
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        licenseTextView.text = text
        licenseTextView.delegate = self
        testString()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationItem.title = "licenseTitleList"
    }
   
}
// MARK: - UITextViewDelegate
extension LicenseViewController: UITextViewDelegate {
    // MARK: custom용
    // 예) 이용약관, 개인정보 보호정책 중에서 고를 경우
    //    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
    ////        UIApplication.shared.open(URL, options: [:], completionHandler: nil)
    ////        return false
    //        let _ = URL.absoluteString
    //
    //        return true
    //    }
}

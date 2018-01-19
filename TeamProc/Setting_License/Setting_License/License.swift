//
//  License.swift
//  Setting_License
//

import Foundation
import UIKit

class License {
    //    var items: [LicenseItem]
    var text = ""
    
    // MARK: 라이선스를 문장으로 만드는 메소드
    private func configureText(to item: LicenseItem, _ ofGitubAddress: String?) -> String {
        if let gitubAddress = ofGitubAddress {
            text =  item.introductionOfLicense + "\n" +
                "Copyright (c)" + "\(item.licenseYear)" + "\(item.name)" +
                "\n" + "(\(gitubAddress))" + "\n" +
                "\n" + item.licenseText
        } else {
            text =  item.introductionOfLicense + "\n" +
                "Copyright (c)" + "\(item.licenseYear)" + "\(item.name)" +
                "\n" + item.licenseText
        }
        return text
    }
    
    //MARK: 특정 문자열을 링크 연결 메소드
    private func attributedOfLink(mutableString string: String,
                                  ofValue: String,
                                  range ofSearchString: String,
                                  textView ofLicense: UITextView) {
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.link, value: ofValue, range: NSString(string: string).range(of: ofSearchString))
        ofLicense.attributedText = attributedString
    }
    
    
}


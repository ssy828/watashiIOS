//
//  License.swift
//  Setting_License
//

import Foundation
import UIKit

class License {
    
    let introductionOfLicense = "The MIT License (MIT)"
    let text = "Copyright (c) "
    let licenseText = """
    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
    """
    
    public func makeText(_ ofGithubAddress: String?,
                         year: Int, name: String,
                         _ textView: UITextView) -> String {
        let item = LicenseListItem.init(name: name, year: year,
                                        githubAddr: ofGithubAddress)
        var sentence = ""
        if let githubAddr = ofGithubAddress {
            sentence =  introductionOfLicense + "\n" +
                text + "<\(item.year)>" + "<\(item.name)>" +
                "\n" + "(\(githubAddr))" + "\n" +
                "\n" + licenseText
            attributedOfLink(sentence, githubAddr, textView)
        }else {
            sentence =  introductionOfLicense + "\n" +
                text + "<\(year)>" + "<\(name)>" +
                "\n" + licenseText
            attributedOfLink(sentence, nil, textView)
        }
        return sentence
    }
    
    private func attributedOfLink(_ string: String,
                                  _ specificText: String?,
                                  _ textView: UITextView) {
        let attributedString = NSMutableAttributedString(string: string)
        if let text = specificText {
            attributedString.addAttribute(.link, value: text, range: NSString(string: string).range(of: text))
            textView.attributedText = attributedString
        }
    }
}


//
//  LicenseListItem.swift
//  Setting_License

import Foundation

struct LicenseListItem {
    
    var name: String
    var year: Int
    var githubAddr: String?
    
    
    // - 깃 주소가 없는 경우
    init(name: String, year: Int) {
        self.name = name
        self.year = year
    }
    
    // - 깃주소가 있을경우
    init(name: String, year: Int, githubAddr: String?) {
        self.init(name: name, year: year)
        if let github = githubAddr {
            self.githubAddr = github
        }
    }
}

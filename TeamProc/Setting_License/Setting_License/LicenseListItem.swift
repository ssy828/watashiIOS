//
//  LicenseListItem.swift
//  Setting_License

import Foundation

struct LicenseListItem {
    
    var name: String
    var year: Int
    var githubAddr: String?
    
    init(name: String, year: Int) {
        self.name = name
        self.year = year
    }
    
    init(name: String, year: Int, githubAddr: String?) {
        self.init(name: name, year: year)
        if let github = githubAddr {
            self.githubAddr = github
        }
    }
}

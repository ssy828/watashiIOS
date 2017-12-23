//
//  DetailTVDataModelItem.swift
//  TableViewMVCpatternTest

import Foundation

struct DetailModelItem {
    
    var avatarImageURL: String?
    var name: String?
    var date: String?  // Date?
    var title: String?
    var preview: String?
    
    init?(data: [String: String]?) {
        if let data = data,
            let avatar = data["avartarImageURL"],
            let name = data["authorName"],
            let date = data["date"],
            let title = data["title"],
            let previewText = data["preview"] {
            self.avatarImageURL = avatar
            self.date = date
            self.title = title
            self.preview = previewText
            self.name = name
        } else {
            return nil 
        }
    }

}

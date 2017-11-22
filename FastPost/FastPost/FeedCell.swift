//
//  FeedCell.swift
//  FastPost
//
//  Created by Dabu on 2017. 11. 17..
//  Copyright © 2017년 Dabu. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  
  @IBOutlet weak var contentLabel: UILabel!
  
  @IBOutlet weak var thumnailImageView: UIImageView!
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  func configureUI(data: Post) {
    titleLabel.text = data.title
    contentLabel.text = data.content
    thumnailImageView.setImageFromURL(data.imageURL!)
  }
  
  
}

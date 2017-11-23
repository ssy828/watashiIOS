//
//  PostTableViewCell.swift
//  TestInstaGram

import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var userImageView: UIImageView?
    @IBOutlet weak var imageView1: UIImageView?
    @IBOutlet weak var userNicknameLabel: UILabel?
    @IBOutlet weak var imageScrollView: UIScrollView?
    @IBOutlet weak var likeButton: UIButton?
    @IBOutlet weak var detailLabel: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

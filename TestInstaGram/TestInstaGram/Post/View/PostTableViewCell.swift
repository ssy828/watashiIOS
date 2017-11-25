//
//  PostTableViewCell.swift
//  TestInstaGram

import UIKit

class PostTableViewCell: UITableViewCell, UIScrollViewDelegate {
    @IBOutlet weak var userImageView: UIImageView?
    @IBOutlet weak var userNicknameLabel: UILabel?
    @IBOutlet weak var dateLabel: UILabel?
    @IBOutlet weak var imageScrollView: UIScrollView?
    weak var imageStackView: UIStackView?
    @IBOutlet weak var likeButton: UIButton?
    @IBOutlet weak var detailLabel: UILabel?
    weak var pageControl: UIPageControl?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        guard let imageScrollView = imageScrollView else {return}
        imageScrollView.delegate = self
        
        let stackView = UIStackView()
        self.imageStackView = stackView
        stackView.axis = .horizontal
        imageScrollView.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(imageScrollView)
            $0.leading.equalTo(imageScrollView)
            $0.trailing.equalTo(imageScrollView)
            $0.bottom.equalTo(imageScrollView)
        }
        
        let pageControl = UIPageControl()
        self.pageControl = pageControl
        contentView.addSubview(pageControl)

        pageControl.snp.makeConstraints {
            $0.centerX.equalTo(imageScrollView)
            $0.bottom.equalTo(imageScrollView).offset(-10)
        }
        
        //pageControl.pageIndicatorTintColor = UIColor.gray
        //pageControl.currentPageIndicatorTintColor = UIColor.gray
    }

    func setData(post: Post){
        guard let imageStackView = imageStackView else {return}
        
        fitImageCountInStackView(count: post.imageUrls.count)
        
        pageControl?.currentPage = 0
        pageControl?.numberOfPages = post.imageUrls.count
        
        for (index, imageUrl) in post.imageUrls.enumerated() {
            (imageStackView.subviews[index] as! UIImageView).sd_setImage(with: URL(string: imageUrl))
        }
        
        userNicknameLabel?.text = post.userNickname
        
        if let date = post.date {
            
            switch Int(Date().timeIntervalSince1970 - date.timeIntervalSince1970) {
            case let time where time < 60:
                dateLabel?.text = "\(time)초 전"
            case let time where time < 60 * 60:
                dateLabel?.text = "\(time/60)분 전"
            case let time where time < 24 * 60 * 60:
                dateLabel?.text = "\(time/3600)시간 전"
            default:
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM/dd HH:mm"
                dateFormatter.locale = Locale.current
                dateFormatter.string(from: date)
                dateLabel?.text = dateFormatter.string(from: date)
            }
            
        }
    }
    
    func fitImageCountInStackView(count: Int){
        guard let imageScrollView = imageScrollView else {return}
        guard let imageStackView = imageStackView else {return}
        let imageViewCountInStackView = imageStackView.subviews.count
        let diff = imageViewCountInStackView - count
        
        if diff < 0 { // 모자르면
            for _ in diff..<0 {
                let imageView = UIImageView()
                imageStackView.addArrangedSubview(imageView)
                imageView.snp.makeConstraints({
                    $0.width.equalTo(imageScrollView)
                    $0.height.equalTo(imageScrollView)
                })
                imageView.layoutIfNeeded()
            }
        } else if diff > 0 { // 넘치면
            for _ in 0..<diff {
                imageStackView.subviews[diff-1].removeFromSuperview()
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        pageControl?.currentPage = index
    }

}

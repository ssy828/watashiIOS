//
//  LyricsView.swift
//  MyMusicPlayer


import UIKit
// 가사뷰 띄울 곳!
// 지금 뷰위에는 올려만 놓고 실행은 뷰컨트롤러에서 한다!
class LyricsView: UIView {
    // 이 클래스 뷰가 처음부터 안 보이게 hidden을 해놓고
    @IBOutlet var textView: UITextView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // MARK: 가사뷰 탭하면 닫기
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapGesture(_:)))
        textView.addGestureRecognizer(tapGesture)
    }
    // 탭해서 눌렀을 경우
    @objc func didTapGesture(_ sender: UITapGestureRecognizer) {
        self.isHidden = true // LyricsView 자체를 숨김
    }
}

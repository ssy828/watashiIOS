//
//  LyricsView.swift
//  MyMusicPlayer


import UIKit
// 가사뷰 띄울 곳!
// 지금 뷰위에는 올려만 놓고 실행은 뷰컨트롤러에서 한다!
class LyricsView: UIView
{
    
    @IBOutlet var textView: UITextView!
 
   
    
    // 연산프로퍼티 + 프로퍼티 감시자 사용
    var data: AlbumInfo?
//    {
//        // 새로운 값이 저장된 직후 사용!
//        didSet{
//           
//            self.textView.text = self.data?.lyrics
//            
//        }
//
//    }
    
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

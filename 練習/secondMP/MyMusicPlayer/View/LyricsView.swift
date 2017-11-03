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
        self.textView.text = data?.lyrics

    }
  
    
  
    
}

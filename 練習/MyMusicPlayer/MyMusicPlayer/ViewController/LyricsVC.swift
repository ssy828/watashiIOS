//
//  LyricsVC.swift
//  MyMusicPlayer

import UIKit
// MARK: 가사뷰띄우기
class LyricsVC: UIViewController {

    @IBOutlet weak var artistLb: UILabel!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var lyricsView: UITextView!
    // MARK: 가사뷰에 필요한 것 준비
    var data: AlbumInfo? //{
//        didSet {
//            self.artistLb.text = data?.artistName
//            self.titleLb.text = data?.title
//            self.lyricsView.text = data?.lyrics
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 이곳에서 먼저 인스턴스가 생성되고
        // ViewController에 넘김
        self.artistLb.text = data?.artistName
        self.titleLb.text = data?.title
        self.lyricsView.text = data?.lyrics
    }

    @IBAction func closeBtn(_ sender: Any) {
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
    }

}

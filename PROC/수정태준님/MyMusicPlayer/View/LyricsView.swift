//
//  LyricsView.swift
//  MyMusicPlayer


import UIKit

class LyricsView: UIView
{
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var titleLb: UILabel!
    
    
    var data: AlbumInfo? 
  
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.textView.text = self.data?.lyrics
        self.titleLb.text = self.data?.title
    }
    
    @IBAction func closeBtn(_ sender: Any)
    {
        
    }
    
}

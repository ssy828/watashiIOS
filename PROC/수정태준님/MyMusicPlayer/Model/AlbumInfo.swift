//

import Foundation
import UIKit
import AVKit
// MARK: 앨범정보 데이터
struct AlbumInfo
{
    var artistName: String?
    var image: UIImage? // 이미지
    var lyrics: String? // 가사
    var imageData: Data?
    var title: String?
    var songURL: String?
    
    init?(fileName: String)
    {
        self.songURL = fileName
        
        // MARK: 1. 번들에서 넣은 노래파일 꺼내오기
        guard let url = Bundle.main.url(forResource: "Music/"+fileName, withExtension: "mp3") else { return }
        
       
        let assets = AVAsset(url: url)
        
        let metadata: [AVMetadataItem] = assets.metadata
        
        self.lyrics = assets.lyrics
        
        for item in metadata
        {
            print(item)
            
            if let key = item.commonKey?.rawValue
            {
                print(key)
                switch key
                {
                case "title":
                    self.title = item.value as? String
                case "artist":
                    self.artistName = item.value as? String
                case "artwork":
                   self.imageData = item.dataValue
                   
                    if let data = imageData
                    {
                        if let image = UIImage(data: data)
                        {
                            self.image = image
                        }
                    }
                default:
                    break
                }
            }
        
        }
    }
}

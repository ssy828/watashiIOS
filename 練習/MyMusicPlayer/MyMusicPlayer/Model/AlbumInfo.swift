//

import Foundation
import UIKit
import AVKit
// MARK: 앨범정보 데이터
struct AlbumInfo {
    var artistName: String?// 가수이름
    var image: UIImage? // 이미지
    var lyrics: String? // 가사
    var imageData: Data? // 이미지 그 자체를 넘길 수 없으므로 데이터형태로 만들고 사용
    var title: String? // 제목
    var songURL: String? // 파일 url 담을 곳
    
    init?(fileName: String) {
        self.songURL = fileName
        
        // MARK: 1. 번들에서 넣은 노래파일 꺼내오기
        guard let url = Bundle.main.url(forResource: "Music/"+fileName, withExtension: "mp3") else { return }
        
        // 2. MARK: AVAsset:
        // 비디오 및 사운드와 같은 시각화된 오디오 비주얼 미디어를 모델링하는데 사용되는 추상 불변 클래스
        let assets = AVAsset(url: url)
        
        // 3. MARK: AVMetadataItem:
        // 시청각관련 데이터 관련 메타데이터로 나타냄
        let metadata: [AVMetadataItem] = assets.metadata
        
        self.lyrics = assets.lyrics
        // 4. 배열에 담긴 AVMetadataItem을 하나씩 빼서
        for item in metadata {
            print(item)
            // 5. rawvalue(원자값)을 통해 키 값에 따라서 처리
            if let key = item.commonKey?.rawValue {
                print(key)
                switch key {
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
                    print("아무것도 없어요~~")
                }
            }
        
        }
    }
}

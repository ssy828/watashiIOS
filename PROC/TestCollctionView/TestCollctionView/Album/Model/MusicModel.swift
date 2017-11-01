

import Foundation
import AVFoundation // 음악파일 가져올 곳
import UIKit
// MARK: 음악모델
// -> 데이터를 이쪽에서 가져와 뿌려줄 예정
// 너무 어렵게 생각하지 말 것
struct MusicModel
{
    // 가수이름, 노래제목, 이미지, 가사
    var singerName: String?
    var title: String?
    var image: UIImage? // 이미지를 담을 곳
    var imgData:Data? // Data??이걸??
    var lyrics: String?
//    var imgList: [UIImage] = [] // 이미지를 담을 배열 근데 필요 없어
    // 이곳에서는 어차피 하나의 곡의 모습만 나오기때문
    
    init?(fileName: String) {
        // 번들에서 파일 가져오기
        guard let url = Bundle.main.url(forResource: "Song/"+fileName, withExtension: "mp3") else { return nil }
        
       
        // MARK: AVAsset:
        /*
         비디오 및 사운드와 같은 시각화 된 오디오 비주얼 미디어를 모델링하는 데
         사용되는 추상 불변 클래스
         
         */
        // 가져온 파일을 각각의 저장프로퍼티에 넣기
        // 미디어를 이용할 인스턴스 할당
        let assets = AVAsset(url: url)
        
        // MARK: -AVMetadataItem:
        // 시청각관련 데이터 관련 메타데이터로 나타냄
        let metaData:[AVMetadataItem] = assets.metadata
        
        // 배열로 된 metaData에서 키를 통해서 값을 꺼내옴
        for item in metaData
        {
            print(item)
            // 옵셔널바인딩을 써서 값을 가져오고
            if let key = item.commonKey?.rawValue
                // 키를 알고 싶으면 이 곳에서 프린트 할 것!
            {
               
                switch key {
                case "title":
                    self.title = item.value as? String
                case "artist":
                    self.singerName = item.value as? String
                case "artwork":
                    self.imgData = item.dataValue
                    // dataValue: 메타아이템의 값의 raw Byte를 제공
                    // 데이터 타입으로 만든 변수에 할당하고
                    // 값이 있다면 image변수에 인스턴스를 할당
                    if let data = imgData // 옵셔널바인딩!
                    {
                        if let image = UIImage(data: data)
                        {
                            self.image = image
//                            self.imgList.append(image)
                        }
                    }
                default:
                    print("훗 아무것도 없다")
                }
            }
        }
        
    }
    
}



// 나만의 셀을 만들기위해 만듦
import UIKit
import AVFoundation

class CustomCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var titleLb: UILabel!

    @IBOutlet weak var artistLb: UILabel!

    @IBOutlet weak var image: UIImageView!
 

    // 모델에서 만든 싱글턴 패턴 인스턴스를 가져와야함
//    var one = MusicManager.musicManager
     // 모델에서 바로 뷰로 넘기는 거라 이건 좋지 않다!

    override func awakeFromNib() {
        super.awakeFromNib()
//        loadImgData()

 
    }
    // MARK: mp3파일을 가져오기
//    func loadImgData()
//    {
//        // 번들에서 가져오기
//        if let url = Bundle.main.url(forResource: "Song/", withExtension: "mp3")
//        {
//            // 미디어를 할 수 있는 인스턴스 할당
//            let asset = AVURLAsset(url:url)
//            // 여러가지 데이터가 들어간 것을 메타데이터
//            let metaData: [AVMetadataItem] = asset.metadata
//            // 우리가 원하는 형태로 모델링해야함
////            Datamodel(data:metaData)
//
//            for item in metaData
//            { // 메타데이터 하나가 우리가 알고 있는 정보 하나!
//                // 다양한 타입의 형태로 존재
//                // 마구잡이로 되어있음
//                if let key = item.commonKey?.rawValue{
//
//                // 데이터 각자 다름
//                // 키를 통해서 값을 가져와서 실행
////                item.commonKey?.rawValue == "title"
//                    switch key
//                    {
//                    case "title":
//                        titleLb.text = item.value as? String
//                    case "artist":
//                        singerLb.text = item.value as? String
//                    case "artwork":
//                        let data = item.dataValue!
//                        imgList.append(UIImage(data: data)!)
////                        imgView.image = UIImage(data: data)
//                    default:
//                        print("아무것도 없다!")
//                    }
//
//                }
//            }
//        }
//
//    }

}



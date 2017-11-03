
import Foundation
import AVKit
class MusicManage
{
    
    // 싱글턴패턴
    static var one: MusicManage = MusicManage()
    
    // 앨범정보를 담을 빈 배열
    var albumInfo: [AlbumInfo] = []
 
    init()
    {
        loadData()
    }
    
    func loadData()
    {
      
        for i in 0...11
        {
            if let music = AlbumInfo.init(fileName: "\(i)")
            {
                // 뮤직파일 하나를 빈 배열에 추가
                albumInfo.append(music)
            }
        }
    }
}

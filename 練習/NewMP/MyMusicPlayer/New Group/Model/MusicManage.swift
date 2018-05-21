
import Foundation
import AVKit // 미디어재생을 위한 것!
// MARK: 앨범정보데이터
// 데이터를 받아 뷰컨트롤러에 넘겨줄 곳!
class MusicManage {
    
    // 싱글턴패턴
    static var one: MusicManage = MusicManage()
    
    // 앨범정보를 담을 빈 배열
    var albumInfo: [AlbumInfo] = []
 
    init(){ loadData() }
    
    func loadData(){
        // 뮤직 파일에 담긴 개수만큼 한객씩 빼와서
        // 앨범정보 이니셜라이저의 파라미터에 뮤직파일1개를
        // music변수에 할당
        for i in 0...11 {
            if let music = AlbumInfo.init(fileName: "\(i)") {
                // 뮤직파일 하나를 빈 배열에 추가
                albumInfo.append(music)
            }
        }
    }
}

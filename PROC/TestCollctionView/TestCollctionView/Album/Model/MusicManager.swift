
import Foundation
// 모델에서 받아온 데이터를 관리
class MusicManager
{
    // 싱글턴패턴
    static var musicManager: MusicManager = MusicManager()
    
    var musicInfo: [MusicModel] = []
    
    init()
    {
        loadData()
    }
    // 노래파일을 배열에 넣어야함
    func loadData()
    {
        // 개수를 모를 경우는??
        for i in 0...29
        {
            // 뮤직모델에 있는 파일을 할당하고
            if let model = MusicModel.init(fileName: "\(i)")
            {
                // 모델에서 만든 값을 배열에 추가!
                musicInfo.append(model)
            }
        }
    }
}

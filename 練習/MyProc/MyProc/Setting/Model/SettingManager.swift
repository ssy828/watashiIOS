
import Foundation
// MARK: -번들에서 가져온 데이터를
// 모델화로 쪼갠 다음에 어레이에 넣고
class SettingManager
{
    // 하나의 인스턴스를 만들어 계속 사용하기 위해
    // 싱글턴패턴: 처음 호출된 뒤부터 계속 그 인스턴스만 사용함
    static var single: SettingManager = SettingManager()
    // SettingManager인스턴스를 single에 할당
    // static: 메모리를 미리 확보하고 시작
    
    // SettingModel타입의 빈 배열
    var settings: [SettingModel] = []

    // 이거 무슨차이?
    
    // 연산프로퍼티
//    var settingData:[SettingModel]{
//        return settings
//    }
    // 누구든지 인스턴스를 만들수 없게 private로 설정
    private init()
    {
        loadData() //이 클래스의 인스턴스가 생성될 때(초기화되면서)호출
    }
    
    // MARK: -데이터 불러오기
    func loadData()
    {
        //1. 번들에서 파일 가져오기
        guard let basepath = Bundle.main.path(forResource: "Settings", ofType: "plist") else { return }
        
        //2. 데이터를 가져와 배열로 만들어 줘야함 : 이 Setting.plist의 Root는 배열로 시작
        // 딕셔너리를 담은 배열로 만들어야함!
        // [String: Any] 선택 이유: ITEM배열에 sectionTitle키의 값은 String이고
        // Data키의 값은 배열이므로 값은 Any로 지정
        // 옵셔널로 준것은 nil을 반환할 수도 있으므로 [저장프로퍼티: 무조건 값이 필요함]
        guard let list = NSArray(contentsOfFile: basepath) as? [[String: Any]] else {return}
        // 3. 번들에서 가져온 것을 배열로 만든 것을 하나씩 꺼내와
        // settings 빈배열에 추가하기 위해
        for element in list
        {
            // 3-1 가져온 element를 다시 SettingModel 타입으로 만들어주기
            if let settings = SettingModel(dataDic: element)
            {
                // 3-2 그 값을 배열에 추가
                self.settings.append(settings)
            }
            
        }
        
        
    }
    
}

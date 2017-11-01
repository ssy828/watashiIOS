
//

import Foundation
// MARK: -가져온 데이터를 배열에 넣은 것을
// 테이블뷰컨트롤러에 넘김 -> 다시말해 각 셀에 넣기 위해서 
struct SettingModel
{
    // 섹션타이틀
    var sectionTitle: String
    // cellData타입의 배열: [Data:[item0],[item1]...]구성
    var data: [CellData] = []
    // CellData타입은 딕셔너리로 만들어 둠
    
    // [String: Any] 선택 이유: ITEM배열에 sectionTitle키의 값은 String이고
    // Data키의 값은 배열이므로 값은 Any로 지정
    // 옵셔널로 준것은 nil을 반환할 수도 있으므로 [저장프로퍼티: 무조건 값이 필요함]
    init?(dataDic: [String: Any])
    {
        guard let title = dataDic["SectionTitle"] as? String else{ return nil }
        self.sectionTitle = title
        // list는 딕셔너리를 담을 배열
        // "Data"키의 값이 있다면 딕셔너리를 담은 배열로 만듦
        guard let list = dataDic["Data"] as? [[String:String]] else { return nil }
        
        // 딕셔너리가 든 배열에서 하나씩 꺼내와 CellData타입(딕셔너리)을 담을 빈배열에 추가함!
        for cell in list
        {
            // CellData구조체에 파라미터dataDic에
            // 딕셔너리를 담은 cell을 가져와 인스턴스를 만들어 cells에 할당
            if let cells = CellData(dataDic: cell)
            {
                // 꺼내온 cells의 값들을 추가함
                data.append(cells)
            }
        }
        
    }
}

// MARK: -cell의 데이터,스타일
struct CellData
{
    // 셀스타일
//    var cellStyle: CellType
    // 컨텐츠 타이틀
    var contentTitle: String
    
    // 초기화: 파라미터 - 인스턴스생성
    init?(dataDic: [String:String])
    {
        // 셀스타일
//        guard let style = dataDic["CellStyle"] else {return nil}
//        cellStyle = CellType(rawValue: style) ?? .basicType
        // ?? : 디폴트면: basicType으로 반환
        guard let title = dataDic["Content"] else { return nil}
        self.contentTitle = title
        
    }
    
}

// MARK: -Cell스타일 : 열거형 활용
// case 항목 자체가 값!
enum CellType: String
{
    case basicType = "SettingBasicCell"
    case detailType = "SettingDetailCell"
    case switchType = "SettingSwitchCell"
    
}


import Foundation
//// 섹션타이틀
//struct SectionTitle
//{
//    var sectionTitle: String
//
//    // init?일 경우 : 가드문 else부분에서 nil을 반환해야함!
//    // 이니셜라이저: 무조건 값을 반환하므로!
//    init?(dataDic: [String: String])
//    {
//        guard let title = dataDic["SectionTitle"] else { return nil }
//        self.sectionTitle = title
//    }
//}

// 설정모델데이터
struct SettingData
{
    // 모든 저장프로퍼티는 값이 있어야하고
    // 초기값이 꼭 필요하다!!
    var sectionTitle: String
    var celldata: [SettingCellData] = []
    
    // 옵셔널 이니셜라이저(init?())이므로 return nil로 반환
    init?(dataDic: [String:Any])
    {
        /*
         
         init(){
             guard let title = dataDic["SectionTitle"] as? String else {
             sectionTitle = ""
             return
             }
         }
 
         */
        guard let title = dataDic["SectionTitle"] as? String else { return nil }
        self.sectionTitle = title
        // "Data"키의 값이 있다면 딕셔너리가 든 배열로 만들고 cells에 할당
        guard let cells = dataDic["Data"] as? [[String:String]] else { return nil }
        
        // cell 하나씩을 빈 배열에 추가
        for cell in cells
        {
            guard let newCell = SettingCellData(data: cell) else { return nil }
            self.celldata.append(newCell) // celldata에 newcell을 추가하는
        }
//            self.celldata = cell
    }
}

// 셀 데이터 모델
struct SettingCellData
{
//    var style:CellType
    var cellTitle:String
    init?(data:[String:String])
    {
        guard let title = data["Content"] else { return nil }
        self.cellTitle = title
        
    }
}
//// 전체 설정모델
//struct SettingModel
//{
////    var sectionTitle: SectionTitle
//    var data:[SettingData] = [] // SettingData 타입의 배열 : 빈배열 // 이곳에 추가
//
//
//    init?(dataDic: [String:Any])
//    {
//        guard let section = dataDic["SectionTitle"] as? [String:Any]
//        self.data = section
//    }
//}


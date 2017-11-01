

import Foundation


class Controller
{
    var datas: [Model] = [ ]
    // 모델 클래스에서 만든 인스턴스가 할당된 데이터가 유동적으로 변하므로 배열을 만들어야함
    var views: [View] = [ ]
    
    
    // 자기 자신이 갖고 있는 모델과 뷰를 사용할 것이므로 파라미터 필요 없음
    // 이 안에서 업데이트만 되면 끝나므로 리턴값 필요 없음
    func updateUI()
    {
        for i in 0..<datas.count
        {
          views[i].timeLabel = String(datas[i].time)
          views[i].textLabel = datas[i].weekDay
          views[i].tf = datas[i].textField
          views[i].viewSwitch = String(datas[i].isActivate)
            
        }
    }
    
}

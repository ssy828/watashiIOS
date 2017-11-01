
// setting뷰컨트롤러
import UIKit

class SettingViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var dataM: SettingManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 뷰가 생성되기전에 데이터모델을 dataM에 할당
        dataM = SettingManager.one
    }
    // 섹션 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingManager.one.settings.count
    }
    
    // 섹션의 Row 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // 파라미터 section을 settings 배열에 넣는다.
            // 그리고 배열인 셀데이터를 계산한다
          return SettingManager.one.settings[section].celldata.count

    }
    
    // 섹션헤더
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataM?.settings[section].sectionTitle
    }
   
    // cell 구현
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // tableView 파라미터를 이용
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        // dataM이 배열인 settingData에 파라미터 indexPath의 프로퍼티 section을 넣고
        // 배열 celldata에 indexPath의 row프로퍼티를 담아
        // 만들어진 인스턴스를 settingModel에 할당하고
        let settingModel = dataM?.settingData[indexPath.section].celldata[indexPath.row]
        // 위의 옵셔널 체이닝 사용!
        
            // 그 인스턴스가 cellTitle 프로퍼티에 접근해 값을 할당
            cell.textLabel?.text = settingModel?.cellTitle
            cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    

   

}

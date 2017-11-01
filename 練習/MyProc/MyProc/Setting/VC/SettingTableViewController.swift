
import UIKit
// MARK: - SettingModel에서
// 받은 것을 이용해 테이블뷰에 뿌려줄 것임
class SettingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    // 미리 만든 하나의 싱글턴을 사용해 SettingManager쪽에 접근!
    var main: SettingManager = SettingManager.single
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
  
    // MARK: - Table view data source
    // 섹션의 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return main.settings.count // 질문! ?물음표로 바꾸면? 옵셔널바인딩?
    }
    
    // MARK: -섹션의 Row(행)개수 : 질문!
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return main.settings[section].data.count
    }

    // MARK: - Cell구현
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 재사용
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCustomCell
        
        // dataManager가 배열인 SettingModel에
        // 파라미터 indexPath의 프로퍼티 section을 넣고
        // 배열 data에 indexPath의 row프로퍼티를 담아
        // 만들어진 인스턴스를 dataManager에 할당하고
        let dataManager = main.settings[indexPath.section].data[indexPath.row]

        // 셀한테 데이터를 주고 다 표시해
        // 뷰컨트롤러: 데이터가 필요할때만 달라고 하는 것
        cell.textLabel?.text = dataManager.contentTitle
        
        // MARK: -섹션/셀 스타일
        switch (indexPath.section,indexPath.row) {
        case (0,0):
            cell.accessoryType = .disclosureIndicator
        case (0,1):
            cell.accessoryType = .disclosureIndicator
         case(1,0): // 이 섹션과 로우에서
//            cell.detailTextLabel?.text = cell.showVersion()
            // 레이블 숨긴 것을 들어내고
            cell.vesionLb.isHidden = false
            // 그 다음에 레이블에 버전을 나타나게 함!
            cell.vesionLb.text = cell.showVersion()
        case (2,0):
            cell.accessoryView = UISwitch()
        default:
            cell.accessoryType = .none
        }
        
        return cell
    }
    // MARK: -섹션&셀 선택했을때 나타나는 행동
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
//    {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCustomCell
//
//        if indexPath.row == 1 && indexPath.row == 2{
//            // 2두번째 셀 클릭시 나타나는
//            cell.accessoryType = .disclosureIndicator
//        }
//    }
    // MARK: -섹션 헤더
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = main.settings[section]
        return title.sectionTitle
    }

  
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

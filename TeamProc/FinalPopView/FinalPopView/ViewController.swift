//
//  ViewController.swift
//  FinalPopView
import UIKit

// PostCell의 xib 파일명, cell ID
let postCell = "PostCell"
// EmptyCell의 xib 파일명, cell ID
let emptyCell = "EmptyCell"
class ViewController: UIViewController {

    // 테스트 데이터
    var testList: [String] = []
    
    // 사용자 정의 팝업
    let popUpView: PopView = UINib(nibName: "View", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! PopView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpPopUpView()
    }

    // MARK: 팝업뷰 세팅
    func setUpPopUpView() {
        // 팝업뷰 생성
        let viewColor = UIColor.black
        // 부모뷰 투명
        popUpView.backgroundColor = viewColor.withAlphaComponent(0.3)
        popUpView.frame = self.view.bounds // 팝업 뷰를 화면에 맞게
        // 팝업창 배경색
        let baseViewColor = UIColor.white
        // 팝업 배경
        popUpView.baseView.backgroundColor = baseViewColor.withAlphaComponent(0.8)
        popUpView.tableView.delegate = self
        popUpView.tableView.dataSource = self
        popUpView.tableView.register(UINib.init(nibName: postCell, bundle: nil), forCellReuseIdentifier: postCell)
        popUpView.tableView.register(UINib.init(nibName: emptyCell, bundle: nil), forCellReuseIdentifier: emptyCell)
        self.view.addSubview(popUpView)
    }

}

//

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = testList.count
        return (count > 0) ? count : 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch testList.count {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: emptyCell, for: indexPath) as! EmptyCell
            tableView.separatorStyle = .none
//            cell.postWritingButton.addTarget(self, action: #selector(postWriting), for: UIControlEvents.touchUpInside)
            cell.delegate = self
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: postCell, for: indexPath)
            let index = indexPath.row
            if let cell = cell as? PostCell {
                cell.postLB.text = testList[index]
            }
            return cell
        }
    }


}

extension ViewController: UITableViewDelegate {
    // 테이블 뷰의 셀 값이 유동적이게 해야하는데;;
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch testList.count {
        case 0:
            return tableView.bounds.size.height
        default:
            return 50
        }
    }
}

extension ViewController: EmptyCellDelegate {
    func emptyCellButton(_ cell: EmptyCell) {
        print("\(#function)")
        let viewController = UIViewController()
        viewController.view.backgroundColor = .blue
        self.present(viewController, animated: true, completion: nil)
    }
    
}



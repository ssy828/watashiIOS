//
//  ViewController.swift
//  FinalPopView
import UIKit

class ViewController: UIViewController {

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
        popUpView.tableView.register(UINib.init(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostCell")
//        tableView.register(UINib.init(nibName: "EmptyCell", bundle: nil), forCellReuseIdentifier: "EmptyCell")
        self.view.addSubview(popUpView)
    }

}

//

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        return cell
    }


}

extension ViewController: UITableViewDelegate {
    
}

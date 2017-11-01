//
//  UITableViewController.swift
//  OctoberTenDay
//
//  Created by SONGYEE SHIN on 2017. 10. 10..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class UITableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{   // 데이터소스에서는 구현해야함!
    // 델리게이트: 구현하지 않아도 됨

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tv: UITableView = UITableView(frame: view.bounds)
        // 기본적: plain으로 설정됨
        
//        let TV: UITableView = UITableView(frame: <#T##CGRect#>, style: <#T##UITableViewStyle#>)
        // style에서 .grouped로 바꿔서 사용 가능!
        
        tv.dataSource = self // 뷰컨트롤러를 데이터 소스에 할당
        tv.delegate = self
        //   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) 실행하려면 호출!
        view.addSubview(tv)
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // cell을 통해서 등록함 : 스토리보드에서는 안 사용해도됨 :
        // 그냥 클래스를 통해서 cell을 만들고 그것을 다시 사용하려할때
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
   
    // cell: UI에 표현되어야하는 뷰
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // 메모리를 효율적으로 사용하려고 deque를 씀!: 재사용
        // deque: 끄집어 낸다. Reusable 재사용할 셀을 끄집어 낸다.
        // identified에서 없는 경우만 새로 생성 -> 있으면 재사용
        cell.textLabel?.text = "this is Cell"
        
        return cell
    }
    
    // cell의 높이!
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 셀 클릭한 후 저장하기 위한 곳
        

        let secondVC1 = SecondUIViewController()
        // 위의 방식: nib(xib) 파일이 있는 경우 사용
        // nib파일 이름이 같은 경우 위처럼 사용 가능!!
        // let secondVc = SecondUIViewController(nibName: "SecondUIViewController", bundle: nil)로 씀
        ////////////////
        // 스토리보드를 통해서 사용하는 방법
      
        let storyboard = UIStoryboard(name: "Main", bundle: nil)// 스토리 보드를 읽어옴
        // SubStoryboard에서 가져온 인스턴스를 할당함
        // secondVC2가 뷰컨트롤러 인스턴스임
        // 인스턴스를 이름으로 불러와서
        
//        let secondVC2 = storyboard.instantiateViewController(withIdentifier: "SecondViewController")  as! SecondUIViewController
        // UIViewController타입인 것을 다운 캐스팅해서 SecondUIViewController타입으로 넣어짐
        // 스토리보드 안에 있는 것을 읽어오라는 것
        // 아이디가 SecondViewController에 해당하는 인스턴스를 가져와서 만드는 것
        // 스토리보드 = 설계도(청사진)
        // 아이디 값에 해당하는 인스턴스를 만들어 내겠다!
        // UIViewConetroller를 리턴하므로!

        // self라는 애가 들어가 있는 스토리보드
        // 현재: 메인!
        // 아이디는 무조건 스토리보드이름과 같게 짓기!
        // 이곳은 같이 있는 경우
        // 제일 안전한 방법
        guard let secondVc2 = self.storyboard!.instantiateViewController(withIdentifier:"SecondViewController") as? SecondUIViewController else { return }
        
        /*
       let secondVc2 = self.storyboard!.instantiateViewController(withIdentifier:"SecondViewController") as! SecondUIViewController
 
         */
        
        // 화면전환
        present(secondVc2, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

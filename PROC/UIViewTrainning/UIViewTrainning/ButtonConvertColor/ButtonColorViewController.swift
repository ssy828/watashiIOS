//
//  ButtonColorViewController.swift
//  UIViewTrainning
//
//  Created by SONGYEE SHIN on 2017. 9. 27..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//


// 9월 27일 (수)
import UIKit

class ButtonColorViewController: UIViewController {

    // MARK: - 프로퍼티
    var btnArray:[UIButton] = []  // UIButton타입을 담을 빈 배열
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 버튼을 추가하기 위함
        // var btn: UIButton = UIButton
       
//        switch tag {
//        case 1,2,3:
//            buttonAddView(x: 10, y: 10, tag: 1)
//        default:
//            <#code#>
//        }
        
    }

    // MARK: - 버튼을 차례대로 추가해서 만들 메소드
    
    // 파라미터: x좌표, y좌표,태그값
    // 반환형 없는 이유: 이 함수는 어차피 뷰를 붙이는 역할만 할 것이므로
    func buttonAddView(x:CGFloat,y:CGFloat,tag: Int)  {
       
            let width = (view.frame.size.width-20)/3  // 전체 버튼의 가로크기
            let height = ((view.frame.size.height-40)/2)/3 // 전체 버튼 세로크기
            let btn: UIButton = UIButton(type:.system) // .system을 해야 자유자재로 바꿀 수 있음
            btn.frame = CGRect(x: x, y: y, width: width, height: height)
            // frame 프로퍼티에 CGRect 할당 x와 y를 CGFloat으로 바꾸고
            // x와 y좌표 파라미터로 받기
            view.addSubview(btn) // 뷰에 버튼을 추가함
            btn.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            btn.setTitle("Button\(tag)", for: UIControlState.selected)
            btn.tag = tag
            btn.addTarget(self, action: #selector(convert(_:)), for: UIControlEvents.touchUpInside)
        
        
    }
    
    // MARK: - 버튼이 액션을 할때 색을 바꿀 계획
    @objc func convert(_ sender: UIButton){
        if sender.isSelected { // 파라미터 버튼이 선택되었을때 색이 바뀌는게 하는 이프문
            // 위에 sender를 선택했으면 (true이면 생략가능)
            // 이프문 조건문 안에서 다시 false로 반환
            sender.isSelected = false
        }else{
            sender.isSelected = true
        }
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

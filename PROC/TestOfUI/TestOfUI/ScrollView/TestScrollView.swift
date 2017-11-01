//
//  TestScrollView.swift
//  UIViewTest
//
//  Created by SONGYEE SHIN on 2017. 10. 9..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class TestScrollView: UIViewController {

    var scroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        scrollView()
        
    }
    
    // 스크롤뷰 예제
    func scrollView()
    {
        let rect: CGRect = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        scroll = UIScrollView(frame: rect)
        scroll.contentSize = CGSize(width: view.frame.size.width*3, height: view.frame.size.height)// 사이즈조정(컨텐츠뷰)조정해 움직이기
        //view.frame.size.width*3 세개의 뷰를 스크롤할 것이므로!
        view.addSubview(scroll)// 전체 뷰에 스크롤뷰 추가
        
        // 스크롤뷰위의 뷰는 bounds로 하는 것이 좋다
        // bounds: 자기 자신만의 좌표!
        let width = scroll.bounds.size.width
        let height = scroll.bounds.size.height
        
        let view1: UIView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        scroll.addSubview(view1) // 스크롤뷰에 뷰를 추가!
        
        let view2: UIView = UIView(frame: CGRect(x: width, y: 0, width: width, height: height))
        view2.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        scroll.addSubview(view2)
        
        let view3: UIView = UIView(frame: CGRect(x: 2*width, y: 0, width: width, height: height))
        view3.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        scroll.addSubview(view3)
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

//
//  ViewController.swift
//  UIViewTrainning
//
//  Created by SONGYEE SHIN on 2017. 9. 25..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        let newView: UIView = UIView(frame:CGRect(x: 10, y: 10, width: 350, height: 647))
        newView.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        view.addSubview(newView)
        
//        let imageView: UIImageView = UIImageView(frame:CGRect(x: 20, y: 20, width: newView.bounds.width-40, height: 320))
//        imageView.image = UIImage(named:"star.png") //imageView인스턴스가 이미지 프로퍼티를 쓰는데 그 값에 그림을 저장하는 것
//        imageView.contentMode = UIViewContentMode.scaleAspectFit
//        newView.addSubview(imageView) // newView위에 imageView에 추가
//
        let imageValue: UIImageView = UIImageView()
        imageValue.image = UIImage(named:"star.png")
        // imageValue.frame.
        let imgView: UIImageView = UIImageView(frame:CGRect(x: 60, y: 60, width: 100, height: 100))
        imgView.image = UIImage(named:"bucks.png")
        imgView.contentMode = UIViewContentMode.scaleAspectFit
        newView.addSubview(imgView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


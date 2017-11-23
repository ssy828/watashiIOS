//
//  ProfileTabViewController.swift
//  TestInstaGram
//
//  Created by SONGYEE SHIN on 2017. 11. 22..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ProfileTabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func test(_ sender: UIButton){
        let postVC = UIStoryboard(name: "Post", bundle: nil).instantiateViewController(withIdentifier: "PostWrite")
        present(postVC, animated: true, completion: nil)
    }

}

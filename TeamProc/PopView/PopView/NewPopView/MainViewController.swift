//
//  MainViewController.swift
//  PopView


import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var popView: PopView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.baseView.addSubview(popView)
//        popView.dateLB.text = "2017-12-05"
    }


}

extension MainViewController {
    
}

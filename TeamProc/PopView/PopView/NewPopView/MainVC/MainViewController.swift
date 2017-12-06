//
//  MainViewController.swift
//  PopView


import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var baseView: PopView!
//    @IBOutlet weak var popView: PopView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(baseView)
        baseView.dateLB.text = "2017-12-05"
//        self.view.addSubview(popView)
    }


}

extension MainViewController {
    
}

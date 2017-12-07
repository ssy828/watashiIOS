//
//  MainViewController.swift
//  PopView

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var baseView: PopView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(baseView)
        baseView.dateLB.text = "2017-12-05"
        self.baseView.addTapGesture(tapNumber: 2, target: self, action: #selector(handlerTapGesture))
        self.view.dismissViewInTapGesture(target: self, action: #selector(dismissHandler))
        
        baseView.delegate = self
    }
    
    // MARK: @objc func handlerTapGesture
    @objc func handlerTapGesture(_ tap: UIGestureRecognizer) {
        print("tap")
        if self.baseView.isHidden == false {
            if let contentview = baseView.contentView {
                contentview.isHidden = false
            }
        }
    }
    
    @objc func dismissHandler(_ tap: UIGestureRecognizer) {
        print("dismiss")
        if self.baseView.isHidden == false {
            self.baseView.isHidden = true
        }else{
            self.baseView.isHidden = false
        }
    }
    
}

extension MainViewController: PopViewDelegate {
    
    func emptyCellButton(_ popView: PopView, cell: EmptyCell) {
        print("\(#function)")
        let viewController = UIViewController()
        viewController.view.backgroundColor = .blue
        self.present(viewController, animated: true, completion: nil)
    }
}


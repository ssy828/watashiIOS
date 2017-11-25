//
//  ProfileTabViewController.swift
//  TestInstaGram


import UIKit
import SwiftKeychainWrapper

class ProfileTabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func test2(_ sender: UIButton){
        KeychainWrapper.standard.removeObject(forKey: "account")
        performSegue(withIdentifier: "unwindSegueProfileToSplash", sender: self)
    }
    
    
    @IBAction func test(_ sender: UIButton){
        let postVC = UIStoryboard(name: "Post", bundle: nil).instantiateViewController(withIdentifier: "PostWrite")
        present(postVC, animated: true, completion: nil)
    }

}

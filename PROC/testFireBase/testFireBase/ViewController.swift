//
//  ViewController.swift
//  testFireBase
//
//  Created by SONGYEE SHIN on 2017. 11. 18..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    var ref: DatabaseReference!
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var valueTF: UITextField!
    
    @IBOutlet weak var Item1: UITextField!
    
    @IBOutlet weak var Item2: UITextField!
    
    @IBOutlet weak var Item3: UITextField!
    
    @IBAction func InsertBtn(_ sender: Any) {
        let itemsRef = ref.child((nameTF.text?.lowercased())!)
        itemsRef.setValue(valueTF.text)
        
        nameTF.text = ""
        valueTF.text = ""
    }
    @IBAction func DeleteBtn(_ sender: Any) {
        let itemRef = ref.child((nameTF.text?.lowercased())!)
        itemRef.removeValue { (error, reference) in
            if error != nil{
                print("itemRemove") 
            }
        }
        
    }
    @IBAction func SelectBtn(_ sender: Any) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       ref = Database.database().reference()
        
        ref.observe(.childAdded) { (dataSnapshot) in
            print("ItemAdded")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  PopView

import UIKit

class PopViewController: UIViewController {
    
    // MARK:
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dateLb: UILabel!
    @IBAction func closeBtn(_ sender: UIButton) {
        
    }
    
    // Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        
    }


}

// MARK: UITableViewDelegate
extension PopViewController: UITableViewDelegate {
    
}

// MARK: UITableViewDataSource
extension PopViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
//        cell.testLB = "yeah "
        return cell
    }
    
    
}

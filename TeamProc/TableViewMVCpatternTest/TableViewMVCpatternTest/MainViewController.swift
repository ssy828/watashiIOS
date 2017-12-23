//
//  ViewController.swift
//  TableViewMVCpatternTest
//

import UIKit

class MainViewController: UIViewController {
    private let dataSource = DetailDataModel()
    
    fileprivate var dataArr = [DetailModelItem]() {
        didSet{
            tableView.reloadData()
        }
    }
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.register(DetailTableViewCell.nib, forCellReuseIdentifier: DetailTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        dataSource.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        dataSource.requestData()
    }
}

extension MainViewController: UITableViewDelegate {
    
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as! DetailTableViewCell
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
}

extension MainViewController: DetailDataModelDelegate {
    func didRecieveDataUpdate(data: [DetailModelItem]) {
        dataArr = data
    }
    
    
}

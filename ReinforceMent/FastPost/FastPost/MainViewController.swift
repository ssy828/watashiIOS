import UIKit

class MainViewController: UIViewController {
  
  var source: [Post]? {
    didSet {
      self.tableView.reloadData()
    }
  }
  let refreshControler = UIRefreshControl()
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    tableView.refreshControl = refreshControler
    refreshControler.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
    
//    PostService.fetchPosts { isSuccess, data in
//      if isSuccess {
//        DispatchQueue.main.async {
//          self.source = data
//        }
//      } else {
//      }
//    }
    PostService.fetchWithAlamofire { data in
      if data == nil {
        // error
      } else {
        DispatchQueue.main.async {
          self.source = data
        }
      }
      
    }
  }
  
  @objc func refresh(_ sender: UIRefreshControl) {
    
    PostService.fetchPosts { isSuccess, data in
      DispatchQueue.main.async {
        sender.endRefreshing()
      }
      
      
      if isSuccess {
        DispatchQueue.main.async {
          self.source = data
        }
      } else {
      }
    }
  }
  
  
}


extension MainViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.source?.count ?? 0
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cellData = self.source?[indexPath.row] else { return UITableViewCell() }
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedCell
    cell.configureUI(data: cellData)
    return cell
  }
}

extension MainViewController: UITableViewDelegate {
  
}









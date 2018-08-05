//  ViewController.swift
//  TestInstaGram
import UIKit
import Firebase
import SDWebImage
import SnapKit

class PostsTabViewController: UIViewController {
    weak var tableView: UITableView?
    var posts = [Post]()
    var isLoading = false
    
    lazy var reference : DatabaseReference = Database.database().reference()
    lazy var storage = Storage.storage()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView()
        self.tableView = tableView
        view.addSubview(tableView)
 
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "postCell")
        tableView.register(UINib(nibName: "PostEmptyTableViewCell", bundle: nil), forCellReuseIdentifier: "emptyCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 40
        tableView.separatorInset = .zero
        
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(handleRefreshControl(_:)), for: .valueChanged)
        
        tableView.refreshControl?.beginRefreshing()
        load(completeHandler: { self.tableView?.refreshControl?.endRefreshing() })
    }
    
    @objc func handleRefreshControl(_ sender: UIRefreshControl){
        load(completeHandler: { self.tableView?.refreshControl?.endRefreshing() })
    }
    
    func load(completeHandler: (() -> Void)? = nil){
        isLoading = true
        posts.removeAll()
        reference.child("posts").queryLimited(toFirst: 100).observeSingleEvent(of: DataEventType.value) { dataSnapshot in
            let postsDict = dataSnapshot.value as? [String: [String:Any]] ?? [:]
            for (key, postDic) in postsDict {
                self.posts.append(Post(key: key, dic: postDic))
            }
            self.isLoading = false
            self.tableView?.reloadData()
            completeHandler?()
        }
    }
    
}
// MARK: UITableViewDataSource
extension PostsTabViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = posts.count
        return (isLoading) ? 0 : (count > 0) ? count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if posts.count == 0 {
            return tableView.dequeueReusableCell(withIdentifier: "emptyCell", for: indexPath)
        } else {
            let index = indexPath.row
            let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
            if let cell = cell as? PostTableViewCell {
                cell.setData(post: posts[index])
            }
            return cell
        }
    }
    
}

struct Post{
    var key: String?
    var userNickname: String = ""
    var imageUrls: [String] = []
    var uid: String = ""
    var date: Date?
    
    init() {}
    
    init(key: String, dic: [String: Any]){
        if let userNickname = dic["userNickname"] as? String {
            self.userNickname = userNickname
        }
        if let imageUrls = dic["imageUrls"] as? [String] {
            self.imageUrls = imageUrls
        }
        if let uid = dic["uid"] as? String {
            self.uid = uid
        }
        if let timestamp = dic["timestamp"] as? Int{
            self.date = Date(timeIntervalSince1970: TimeInterval(timestamp / 1000))
        }
    }
    
    var dictionary: [String:Any] {
        var dic = [String:Any]()
        dic["userNickname"] = userNickname
        dic["imageUrls"] = imageUrls
        dic["uid"] = uid
        dic["timestamp"] = ServerValue.timestamp()
        return dic
    }
}


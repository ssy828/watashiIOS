//  ViewController.swift
//  TestInstaGram
import UIKit
import Firebase
import SDWebImage
import SnapKit

class PostsTabViewController: UIViewController {
    weak var tableView: UITableView?
    var posts = [Post]()
    
    lazy var reference : DatabaseReference = Database.database().reference()
    lazy var storage = Storage.storage()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView()
        self.tableView = tableView
        view.addSubview(tableView)
        //        tableView.translatesAutoresizingMaskIntoConstraints = false
        //
        //        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        //        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        //        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        //        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        //
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "postCell")
        //tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 40
        tableView.separatorInset = .zero
        
        reference.child("posts").observeSingleEvent(of: DataEventType.value) { dataSnapshot in
            let postsDict = dataSnapshot.value as? [String: [String:Any]] ?? [:]
            for (key, postDic) in postsDict {
                var post = Post()
                post.key = key
                if let title = postDic["title"] as? String {
                    post.title = title
                }
                if let imageUrl = postDic["imageUrl"] as? String {
                    post.imageUrl = imageUrl
                }
                if let uid = postDic["uid"] as? String {
                    post.uid = uid
                }
                self.posts.append(post)
            }
            tableView.reloadData()
        }
        
        //TODO load
    }
}
// MARK: UITableViewDataSource
extension PostsTabViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
        if let cell = cell as? PostTableViewCell {
            let post = posts[index]

            cell.imageView1?.sd_setImage(with: URL(string: post.imageUrl))
            //cell.userImageView?.image = storage.reference(forURL: post.imageUrl).
            cell.userNicknameLabel?.text = "닉네임"
            cell.imageScrollView?.backgroundColor = .gray
            cell.detailLabel?.text = post.title

        }
        
        return cell
    }
    
}
// MARK: UITableViewDelegate
extension PostsTabViewController: UITableViewDelegate{
    
}

struct User{
    var idx: Int
    var nickName: String
}

struct Post{
    var key: String?
    var title: String = ""
    var imageUrl: String = ""
    var uid: String = ""
}


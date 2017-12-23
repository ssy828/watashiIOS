// 노티를 포스트하는 부분
// 이 부분에서 테이블뷰에서 사용하는 데이터모델 인스턴스를 생성
let newData = NewData()

// 특정노티피케이션이름으로 post를 해주면서 object파라미터에 원하는 데이터를 넣는다.
NotificationCenter.default.post(name: NSNotification.Name.init("노티피케이션이름"), object: newData, userInfo: nil)



// 노티를 받아서 사용하는 부분

// 노티를 받았을 때 호출되는 메소드 
@objc func getNotification(notification: Notification) {
    
	guard let someData = notification.object else { return }
    // 테이블뷰의 사용되는 데이터소스 중 특정인덱스에 있는 데이터를 노티피케이션으로 받은 데이터로 바꾸어준다.
    someDataSource[0] = someData
    tableView.reloadData()
  }

override func viewDidLoad() {
    super.viewDidLoad()
	
	NotificationCenter.default.addObserver(
      self,
      selector: #selector(getNotification),
      name: .postDidLike,
      object: nil
    )
}


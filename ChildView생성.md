##가사뷰컨트롤러나오는 방법

 -셀에서 바로 받아 셀렉터에서 실행하는 법
	 extension ViewController: UICollectionViewDataSource
	{
	    
	    // MARK: 섹션의아이템(셀)개수
	    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
	        return musicModel.albumInfo.count
	    }
	    // MARK: 셀구현
	    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
	        
	        // 셀 재사용  // 이부분 정리필요!!!
	        
	        // 커스텀셀로 다운 캐스팅??
	        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
	        
	        // 뮤직모델(인스턴스)가 앨범정보배열에 파라미터 indexPath의 row프로퍼티를 담음??
	        let data = musicModel.albumInfo[indexPath.row]
	        
	        // 셀에서 넘길때 사용하는 것!
	        cell.artistLb.text = data.artistName
	        cell.imageView.image = data.image
	        cell.titleLb.text = data.title
	        cell.textView.text = data.lyrics
	        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapGesture(_:)))
	        cell.textView.addGestureRecognizer(gesture)
	        return cell
	        
	    }
	    // MARK: 탭 했을때 가사뷰 띄우기
	    @objc func didTapGesture(_ sender: UITapGestureRecognizer)
	{
		        let lyricsView = UIView(frame: CGRect(x: self.view.frame.size.width/2 - 5, y: self.view.frame.size.width/2 - 5, width: 10, height: 10))
	        lyricsView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
	        
	        view.addSubview(lyricsView)
	        
	         UIView.animate(withDuration: 0.3) {
	            [unowned self] in lyricsView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
	        }
	   }
	
	}
	
	// MARK: CollectionViewDelegateFlowLayout
	extension ViewController: UICollectionViewDelegateFlowLayout
	{
	    // MARK: 확장에서
	    // 저장프로퍼티만 불가능!
	 
	    
	    // MARK: 셀(아이템) 사이즈 지정
	    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
	        let width = collectionView.bounds.size.width * 0.8
	        let height = collectionView.bounds.size.height * 0.9
	
	        return CGSize(width: width, height: height)
	    }
	
	    
	    // MARK: 아이템 간격
	    // 지금: Horizontal로 되어있으므로
	//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
	//        return 10
	//    }
	    
	    // MARK: 모든 아이템 간격 맞추기
	    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
	//        let sideInset = (collectionView.bounds.size.width - collectionView.bounds.size.height * 1.15) / 2
	        let sideInset = (collectionView.bounds.size.width * 0.18 ) / 2
	        return UIEdgeInsets(top: 0, left: sideInset, bottom: 0, right: sideInset)
	    }
	}


 -새로운 뷰컨트롤러 만들어서 사용하는 법
 
	 import UIKit
	// MARK: 가사뷰띄우기
	class LyricsVC: UIViewController {
	
	    @IBOutlet weak var artistLb: UILabel!
	    @IBOutlet weak var titleLb: UILabel!
	    @IBOutlet weak var lyricsView: UITextView!
	    // MARK: 가사뷰에 필요한 것 준비
	    var data: AlbumInfo?{
	        didSet{
	            self.artistLb.text = data?.artistName
	            self.titleLb.text = data?.title
	            self.lyricsView.text = data?.lyrics
	        }
	    }
	    
	    override func viewDidLoad() {
	        super.viewDidLoad()
	
	        // Do any additional setup after loading the view.
	    }
	
	   
	    
	
	}
 
 -UIView를 상속받는 뷰클래스를 만드는 방법
		 
	import UIKit
	
	class LyricsView: UIView {
	    
	@IBOutlet weak var textView: UITextView!
	var data:AlbumDataModel? {
	    didSet {
	        self.textView.text = self.data?.lyrics
		  		}
		}
	    
	}
 
 
--
어떤 액션을 취할지는 코드만 입력가능!
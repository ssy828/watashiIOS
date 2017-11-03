
import UIKit
import AVKit
// MARK: 뷰컨트롤러
// 데이터와 뷰 사이에서 연결통로
class ViewController: UIViewController {
    
    // MARK: ***UI연결 중요***
    // 뷰랑 뷰컨트롤러 데이터소스와 델리게이트 꼭 연결!!!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lyricsView: LyricsView!
    @IBOutlet weak var lyricViewAnimatorY: NSLayoutConstraint!
    @IBOutlet weak var lyricTextView: UITextView!
    // 음악 연결 인스턴스
    var audioPlayer: AVPlayer?
   
    // MARK: SongData 관리
    var currentIndex: Int = 0 // 현재 위치에 나타날 데이터 불러오기
    // MusicManager의 싱글패턴을 멤버변수에 할당
    var musicModel = MusicManage.one
   
   
    
    // MARK: -Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //musicModel = MusicManage()
        print("정태준이 부릅니다", musicModel.albumInfo[0].lyrics)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(deletelyricView(_:)))
        lyricTextView.addGestureRecognizer(gesture)
        
        // Do any additional setup after loading the view, typically from a nib.
        //        loadData()
        //        self.collectionView.isPagingEnabled = true
        
    }
    
    @objc func deletelyricView(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.3) {
            self.lyricViewAnimatorY.constant = -667
            self.view.layoutIfNeeded()
        }
    }
    
    
}
// MARK: Action
extension ViewController
{
    // 뒤로가기 버튼
    @IBAction func previousBtn(_ sender: Any) {
        
    }
    // 실행 버튼
    @IBAction func playBtn(_ sender: Any) {
        
        // 음악이 저장된 파일주소 저장될 곳
        
        if let urlPath = Bundle.main.url(forResource: "Music/0", withExtension: "mp3")
        {
            // 음악 URL 담을 프로퍼티 필요하고
            let asset = AVAsset(url: urlPath)
            let playItem = AVPlayerItem(asset: asset, automaticallyLoadedAssetKeys: nil)
            audioPlayer = AVPlayer(playerItem: playItem)
            audioPlayer?.play()
        }
        
    }
    // 다음곡 실행버튼
    @IBAction func nextBtn(_ sender: Any) {
    }
    
    // 볼륨
    @IBAction func slider(_ sender: Any) {
        
    }
    
    // 버튼사용시 음악파일 데이터를 가져와야하므로 -> 함수필요
    func musicPlay()
    {
//        let url = 
        if let urlPath = Bundle.main.url(forResource: "Music/0", withExtension: "mp3")
        {
            let assets = AVAsset(url: urlPath)
            let playItem = AVPlayerItem(asset: assets)
            audioPlayer = AVPlayer(playerItem: playItem)
            audioPlayer?.play()
        }
    }
    
}
// MARK: Datasource
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
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapGesture(_:)))
        cell.textView.addGestureRecognizer(gesture)
        // 셀에서 넘길때 사용하는 것!
        cell.artistLb.text = data.artistName
        cell.imageView.image = data.image
        cell.titleLb.text = data.title
        cell.textView.text = data.lyrics

        return cell
        
    }
    // MARK: 탭 했을때 가사뷰 띄우기
    @objc func didTapGesture(_ sender: UITapGestureRecognizer)
    {
//        lyricsView.data = musicModel.albumInfo[currentIndex]
        print(currentIndex)
        UIView.animate(withDuration: 0.3) {
            self.lyricViewAnimatorY.constant = 0
            self.lyricTextView.text = self.musicModel.albumInfo[self.currentIndex].lyrics
            self.view.layoutIfNeeded()
        }
        
    }
}
// MARK: UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate
{
    // MARK: 셀이 선택되었을 때 실행하는 부분
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        currentIndex = indexPath.row // 현재 선택할 음악 위치
        
    }
}

// MARK: CollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout
{
    // 확장: 저장프로퍼티만 불가능!
    
    // MARK: 셀(아이템) 사이즈 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width * 0.8
        let height = collectionView.bounds.size.height * 0.9
        
        return CGSize(width: width, height: height)
    }
    
    // MARK: 모든 아이템 간격 맞추기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        //        let sideInset = (collectionView.bounds.size.width - collectionView.bounds.size.height * 1.15) / 2
        let sideInset = (collectionView.bounds.size.width * 0.18 ) / 2
        return UIEdgeInsets(top: 0, left: sideInset, bottom: 0, right: sideInset)
    }
}





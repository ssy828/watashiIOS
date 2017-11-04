
import UIKit
import AVKit
import AVFoundation
// MARK: 뷰컨트롤러
// 데이터와 뷰 사이에서 연결통로
class ViewController: UIViewController {
    
    // MARK: ***UI연결 중요***
    // 뷰랑 뷰컨트롤러 데이터소스와 델리게이트 꼭 연결!!!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lyricsView: LyricsView!
//    @IBOutlet weak var playBtn: UIButton!
    // 이미 이곳에서 뷰가 만들어지고
    // -> LyricsView 이곳에서 아무리 데이터를 생성해도 받아오질 못함
    // 그래서 여기 뷰컨트롤러에서 받아오는 것을 씀!
    
    // MARK: 음악관련 프로퍼티
    // 음악 연결 인스턴스
    // var player: AVPlayer?
    var audioPlayer: AVAudioPlayer! // AVFoundation에 있는 클래스
  
    // MARK: SongData 관리
    var currentIndex: Int = 0 // 현재 위치에 나타날 데이터 불러오기
    // MusicManager의 싱글패턴을 멤버변수에 할당
    lazy var musicModel: MusicManage = MusicManage.one
   
    // MARK: -Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        loadData()
        //        self.collectionView.isPagingEnabled = true
        let baseURL = musicModel.albumInfo[currentIndex]
        // 번들에 담긴 음악주소를 가져와서 실행
        if let url =  Bundle.main.url(forResource: "Music/\(baseURL.songURL)", withExtension: "mp3")
        {
            do{ // AVAudioPlayer는 throws 사용하므로
                audioPlayer = try AVAudioPlayer(contentsOf: url)
            }catch let error{
                print(error.localizedDescription)
            }
        }
    }
  
}
// MARK: Action
extension ViewController
{
    // 뒤로가기 버튼
    @IBAction func previousBtn(_ sender: UIButton) {
       // 현재 인덱스에서 전의 인덱스로 가야하므로 -1
        currentIndex -= 1
        // 음악플레이 메서드
        musicPlay()
        // 페이지 바뀌는 메서드
        clickToTheCurrentPage()
        
    }
    // 실행 버튼
    @IBAction func playOrPauseBtn(_ sender: UIButton) {
        audioPlayer.prepareToPlay()
        // 버퍼를 미리 준비해 재생할 오디오 플레이어 준비함!
        if audioPlayer.isPlaying
        {
            audioPlayer.pause()
            sender.setImage((#imageLiteral(resourceName: "46-multimeda-pause")), for: UIControlState.normal)
        }else{
            audioPlayer.play()
            sender.setImage((#imageLiteral(resourceName: "42-multimeda-play")), for: UIControlState.normal)
        }

    }
    // 다음곡 실행버튼
    @IBAction func nextBtn(_ sender: UIButton) {
        // 다음 곡 실행을 위해 현재인덱스에서 1을 더함
        currentIndex += 1
        // 음악플레이 메서드
        musicPlay()
        // 페이지 바뀌는 메서드
        clickToTheCurrentPage()
    }
    
    // 볼륨
    @IBAction func slider(_ sender: Any) {
        
    }
    
    // MARK: 음악플레이 메소드
    // 버튼사용시 음악파일 데이터를 가져와야하므로 -> 함수필요
    func musicPlay()
    {
        let baseURL = musicModel.albumInfo[currentIndex]
        // 번들에 담긴 음악주소를 가져와서 실행
        if let url =  Bundle.main.url(forResource: "Music/\(baseURL.songURL)", withExtension: "mp3")
        {
            do{ // AVAudioPlayer는 throws 사용하므로
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                if audioPlayer.isPlaying == false
                { // 음악실행 중아니면 -> 음악실행
                    audioPlayer.play()
                }else
                {// 음악실행 중이면 -> 음악멈춤
                    audioPlayer.pause()
                }
            }catch let error{
                print(error.localizedDescription)
            }
        }
    }
    // MARK: 버튼을 누르면 그 다음 페이지가 뜨게하는 메소드
    func clickToTheCurrentPage()
    {
        collectionView.scrollToItem(at: IndexPath.init(row: currentIndex, section: 0), at: .centeredHorizontally , animated: true)
        // 현재 컬렉션 뷰를 horizontal로 설정해서
        // 스크롤이 넘길때 수평으로 넘어가서 .centeredHorizontally로 설정
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
    
        
        // 커스텀셀로 다운 캐스팅
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        
        // 뮤직모델(인스턴스)가 앨범정보배열에 파라미터 indexPath의 row프로퍼티를 담음
        let data = musicModel.albumInfo[indexPath.row]

        // 셀에서 넘길때 사용하는 것!
        cell.artistLb.text = data.artistName
        cell.imageView.image = data.image
        cell.titleLb.text = data.title
        cell.textView.text = data.lyrics

        return cell
        
    }
  
}
// MARK: UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate
{
    // MARK: 셀이 선택되었을 때 실행하는 부분
    // 어느 곳을 선택해도 가사뷰 나오게하려고 이쪽에 넣음
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentIndex = indexPath.row // 현재 선택할 음악 위치
        
        lyricsView.isHidden = false // 셀 선택시 가사뷰 보이게 하고
        lyricsView.textView.text = self.musicModel.albumInfo[indexPath.row].lyrics
        // 이때 가사뷰인스턴스가 LyricsView 클래스에 있는
        //  textView 인스턴스의 텍스트 프로퍼티에 가사 넣기
        //  데이터를 담은 배열에서 각 셀의 indexPath.row 를
        //  인덱스를 통해 해당 셀이 표시해야 할 정보를 가져옴
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





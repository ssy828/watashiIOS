

import UIKit
import AVFoundation

class MusicViewController: UIViewController {

    // 셀의 싱글턴 패턴 인스턴스를 가져와서 저장
    var one = MusicManager.musicManager
 
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBAction func previousBtn(_ sender: Any) {
    }
    @IBAction func playBtn(_ sender: Any) {
    }
    
    @IBAction func nextBtn(_ sender: Any) {
       
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.isPagingEnabled = true
        // 커버플로레이아웃 사용할 때: 주석처리
        // 항상 콘텐츠의 width에 맞게 움직이므로
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: 확장
extension MusicViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return one.musicInfo.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collecitonCell", for: indexPath) as! CustomCollectionViewCell
        
        cell.titleLb.text = one.musicInfo[indexPath.item].title
        cell.artistLb.text = one.musicInfo[indexPath.item].singerName
        cell.image.image = one.musicInfo[indexPath.item].image
    
        return cell
    }
    
    // MARK: 중요!!!
    // 컬렉션 사이즈를 지정!
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        let height = collectionView.frame.size.height
        return CGSize(width: width, height: height)
    }
    
    // MARK: -InteritemSpacing: 아이템 간 간격
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
    
    // MARK: -마진같은 역할?
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        let sideInset = collectionView.frame.size.width * 0.5
//        let topInset = collectionView.frame.size.height/2
//
//        return UIEdgeInsets(top: topInset, left: sideInset, bottom: topInset, right: sideInset)
//    }
//
    // MARK: CoverFlow
   
}


// MARK: 스크롤뷰이용해
// 라벨을 뷰컨트롤러에 넣었을 경우:
// 가수이름과 노래제목이 넘겨서 보여야하므로
//extension MusicViewController: UIScrollViewDelegate
//{
//    // 지금 셀에 이미 데이터를 넘어오게 만들었으므로 필요 없다!!
////    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
////        let pageIndex = Int(targetContentOffset.pointee.x /scrollView.bounds.size.width)
//////        let seletedData = dataManager.sonDatas[pageIndex]
////        let selectedData = one.musicInfo
////
////    }
//}



import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 헤더부분이 교체되는 것!
    layout.sectionHeadersPinToVisibleBounds = true
     
    }
    // MARK: 중요!!
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        let width = self.collectionView.frame.size.width / 3
//        // 한 라인당 3개씩!
//
//        // sizeForItemAt 메소드 사용안할때는 이것을 사용
//        // sizeForItemAt 메소드:
//        // 아이템마다 값을 다르게 하고 싶은 경우!
//        layout.itemSize = CGSize(width: width, height: width)
    }
}

extension ViewController: UICollectionViewDataSource
{
    // MARK: 섹션 개수
    // 섹션이 4개라서 고정되서 안보이는 것
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
        // return 1로 섹션하면 고정시키는 것! 
    }
    
    // 해당섹션당 몇개의 셀
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    // 셀 구현
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 파라미터의 컬렉션뷰를 가져와야함
        // 셀에 없다면 만들어주고 있다면 재사용
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.contentView.backgroundColor = #colorLiteral(red: 0.6398879069, green: 0.5883992768, blue: 1, alpha: 1) // 모든 컨텐츠는 다 이 뷰에 올라감
        // 안보이는 이유: 또다른 뷰위에 아이템을 올려서
        return cell
    }
    
    // MARK: 헤더뷰/푸터뷰 ->
    // kind 파라미터로 값이 넘어옴
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
        return headerView
        
    }
    
}
extension ViewController: UICollectionViewDelegateFlowLayout
{
    // MARK: -오토레이아웃 적용된 다음에 사이즈 적용!!
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width/3
        return CGSize(width: width, height: width)
       
    }
    
}

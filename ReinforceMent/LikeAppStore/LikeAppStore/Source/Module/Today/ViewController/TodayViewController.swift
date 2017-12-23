import UIKit

class TodayViewController: UIViewController {
  
  // MARK: Property
  @IBOutlet weak var collectionView: UICollectionView!
  
  var dataSource: [Todays]? {
    didSet {
      collectionView.reloadData()
    }
  }
  
  // MARK: - View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    setupView()
    fetchData()
  }
  
}


// MARK: - Setup
extension TodayViewController {
  
  private func setupView() {
    
    collectionView.register(
      UINib.init(nibName: "TodayReusableView", bundle: nil),
      forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
      withReuseIdentifier: "TodayReusableView"
    )
    collectionView.register(
      UINib(nibName: "TodayCell", bundle: nil),
      forCellWithReuseIdentifier: "TodayCell"
    )
    collectionView.register(
      UINib(nibName: "TodayGameCell", bundle: nil),
      forCellWithReuseIdentifier: "TodayGameCell"
    )
  }
}

// MARK: - Fetch
extension TodayViewController {
  
  private func fetchData() {
    
    TodayService.fetch { [weak self] response in
      guard let `self` = self else { return }
      switch response.result {
      case .success(let value):
        self.dataSource = value
      case .failure(let error):
        print(error)
        return
      }
    }
  }
}

// MARK: - UICollectionViewDataSource
extension TodayViewController: UICollectionViewDataSource {
  
  
  func numberOfSections(
    in collectionView: UICollectionView
  ) -> Int {
    return dataSource?.count ?? 0
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return dataSource?.count ?? 0
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    
    guard let cellData = dataSource?[indexPath.section].items[indexPath.item]
      else { return UICollectionViewCell() }
    
    switch indexPath.row {
    case let value where value % 2 == 0:
      let todayCell = collectionView.dequeueReusableCell(
        withReuseIdentifier: "TodayCell",
        for: indexPath
        ) as! TodayCell
      todayCell.configure(for: cellData)
      return todayCell
      
    default:
      let todayGameCell = collectionView.dequeueReusableCell(
        withReuseIdentifier: "TodayGameCell",
        for: indexPath
      ) as! TodayGameCell
      todayGameCell.configure(for: cellData)
      return todayGameCell
    }
    
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    viewForSupplementaryElementOfKind kind: String,
    at indexPath: IndexPath
  ) -> UICollectionReusableView {
    guard let headerData = dataSource?[indexPath.section]
      else { return UICollectionReusableView () }
    
    let header = collectionView.dequeueReusableSupplementaryView(
      ofKind: kind,
      withReuseIdentifier: "TodayReusableView",
      for: indexPath
    ) as! TodayReusableView
    header.configure(for: headerData)
    
    return header
  }
  
}

// MARK: - UICollectionViewDelegate
extension TodayViewController: UICollectionViewDelegate {
  
  func collectionView(
    _ collectionView: UICollectionView,
    didSelectItemAt indexPath: IndexPath
  ) {
    guard let todayModel = dataSource?[indexPath.section].items[indexPath.item]
      else { return }
    let todayStoryboard = UIStoryboard(name: "Today", bundle: nil)
    let detailViewController = todayStoryboard.instantiateViewController(
      withIdentifier: "TodayDetailViewController"
    ) as! TodayDetailViewController
    
    detailViewController.todayModel = todayModel
    present(detailViewController, animated: true, completion: nil)
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension TodayViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    let width = collectionView.boundsWidth * 0.9
    let height = collectionView.boundsHeight * 0.6
    return CGSize(width: width, height: height)
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    referenceSizeForHeaderInSection section: Int
  ) -> CGSize {
    
    let width = collectionView.boundsWidth * 0.9
    let height = CGFloat(100)
    return CGSize(width: width, height: height)
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    insetForSectionAt section: Int
  ) -> UIEdgeInsets {
    let insetMargin: CGFloat = 20
    return UIEdgeInsetsMake(insetMargin, 0, insetMargin, 0)
  }
}











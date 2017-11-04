##CollectionView

###scrollToItem(at:at:animated:)
-지정된 항목이 표시될때까지 컬렉션 보기 내용을 스크롤함

	func scrollToItem(at indexPath: IndexPath, 
	at scrollPosition: UICollectionViewScrollPosition, animated: Bool)


#### -at indexPath: IndexPath

뷰로 스크롤 할 항목의 인덱스 경로입니다.

#### -at scrollPosition: UICollectionViewScrollPosition

스크롤이 끝날 때 항목의 위치를 지정하는 옵션입니다. 가능한 값의 목록은 UICollectionViewScrollPosition을 참조하십시오.

#### -animated: Bool

스크롤 동작의 애니메이션 적용시 true!

스크롤 뷰의 표시 내용을 즉시 조정할시 false 선택함!

//
//  CustomFlowLayout.swift
//  MyMusicPlayer
//
//  Created by SONGYEE SHIN on 2017. 10. 30..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {
    // MARK: 스크롤 멈췄을 때 보여지는 컨텐츠 중앙에 맞추기 위해서
    // 스크롤했을때 멈추는 곳 포인트!
//    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
//        guard self.collectionView != nil else {
//            return proposedContentOffset
//        }
//       
//        return CGPoint(x: 20, y: 20)
//    }
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        guard let collectionView = self.collectionView  else {
            return proposedContentOffset
        }
        //현재 컬렉션 뷰의 [UICollectionViewLayoutAttributes] 가져오기
        guard let attributeList =  self.layoutAttributesForElements(in: collectionView.bounds) else {
            return proposedContentOffset
        }
        
        //거리가 가장 가까운 순으로 정렬
        let sortedAttributeList = attributeList.sorted {
            (attribute1, attribute2) -> Bool in
            distance(ofCenter: attribute1.center.x) < distance(ofCenter: attribute2.center.x)
        }
        //가장 가까은 아이템의 센터 위치
        let nearItemCenter = sortedAttributeList.first?.center.x
        
        //중앙으로 이동
        let screenXCenter = collectionView.frame.size.width / 2
        let targetContentOffset = CGPoint(x:nearItemCenter! - screenXCenter,
                                          y: proposedContentOffset.y)
        
        return targetContentOffset
    }
    
    func distance(ofCenter centerx:CGFloat) -> CGFloat
    {
        guard let collectionView = self.collectionView else {
            return 0
        }
        //현재 아이템의 offsetX + 센터
        let offSet = collectionView.contentOffset.x + (collectionView.bounds.size.width/2)
        return  fabs(offSet - centerx)
    }
    
    
}

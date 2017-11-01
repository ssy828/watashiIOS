##Gesture

#### 셀을 이용해 사용할 경우

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
	        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapGesture(_:)))
	//        tapGesture.delegate = self // UIGestureRecognizerDelegate 사용할 때 가능!
	        cell.textView.addGestureRecognizer(tapGesture)
	        
	        return cell
	        
	    }
	    
	    @objc func didTapGesture(_ sender: UITapGestureRecognizer) {
	        //
	    }

	    
#### 버튼을 누를 때 사용할 경우
- UIGestureRecognizerDelegate : 제스쳐인스턴스와 뷰컨트롤러 연결 필요!

		
		extension ViewController: UIGestureRecognizerDelegate
		{
			// 자주 사용하는 메소드: 이 메소드를 통해서 탭 했을 시 실행!
		    func gestureRecognizer(_ gestureRecognizer:
		     UIGestureRecognizer, shouldReceive touch: UITouch) 
		    -> Bool {
		        
		        // 그래야 항상 탭이 실행될때마다 그 메소드가 사용됨
		        return true
		    }
		}
###클로저 안에서 데이터를 읽을 경우
--

예제 코드)

	//MARK: - 셀이 선택 되었을 때 불림
	    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
	        formater.dateFormat = "yyyy년 MM월 dd일"
	        selectedDate = formater.string(from: date)
	        print("같은 날짜가 찍혔습니다.", selectedDate!, oldDate)
	        // 데이트를 선택하면 그 날짜에 해당하는 데이터가 테이블 뷰에 나타남
	        if oldDate == selectedDate {
	                self.reference.child("users").child(self.userID!).child("calendar").observe(.value, with: { (snapshot) in
	                    if let value = snapshot.value as? [String : [String: Any]] {
	                        self.contentTitleList.removeAll()
	                        for (_, calendarDic) in value {
	                            guard let date = calendarDic["date"] as? String else { return }
	                            print(date)
	                            if date == self.selectedDate {
	                                guard let title = calendarDic["title"] as? String else { return }
	                                self.contentTitleList.insert(title, at: 0)
	                                self.popUpView.tableView.reloadData()
	                            }
	                        }
	                    }
	                })
	            self.popUpView.alpha = 1
	            self.popUpWritingDelegate(date: selectedDate!)
	        }else {
	            oldDate = selectedDate!
	        }
	        handleCellSelected(cell: cell, cellState: cellState)
	        handleCellTextColor(cell: cell, cellState: cellState)
	    }
	    
--
- 위의 코드는 여러 데이터를 불러올때 무리가 됨
- **클로저 안에서 데이터를 읽기 전에 배열 removeAll처리
그리고 if문을 벗어난 지점에 tableview.reloadData처리**   
-> 그러면 for문을 돌때마다 tableview.reloadData 안 함 

#####다시 코드 정리

	//MARK: - 셀이 선택 되었을 때 불림
	    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
	        formater.dateFormat = "yyyy년 MM월 dd일"
	        selectedDate = formater.string(from: date)
	        print("같은 날짜가 찍혔습니다.", selectedDate!, oldDate)
	        // 데이트를 선택하면 그 날짜에 해당하는 데이터가 테이블 뷰에 나타남
	        if oldDate == selectedDate {
	            self.reference.child("users").child(self.userID!).child("calendar").queryOrdered(byChild: "date").queryEqual(toValue: self.selectedDate).observe(.value, with: { (snapshot) in                
	                self.contentTitleList.removeAll()
	                if let value = snapshot.value as? [String : [String: Any]] {
	                    print(value) // 생각한 시점마다 불리는 지 확인
	                    for (_, calendarDic) in value {
	                        guard let date = calendarDic["date"] as? String else { return }
	                        print(date)
	                        if date == self.selectedDate {
	                            guard let title = calendarDic["title"] as? String else { return }
	                            self.contentTitleList.insert(title, at: 0)
	                        }
	                    }
	                }
	                self.popUpView.tableView.reloadData()
	            })
	            self.popUpView.alpha = 1
	            self.popUpWritingDelegate(date: selectedDate!)
	        }else {
	            oldDate = selectedDate!
	        }
	        handleCellSelected(cell: cell, cellState: cellState)
	        handleCellTextColor(cell: cell, cellState: cellState)
	    }
	    
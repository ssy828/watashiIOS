//
//  ViewController.swift
//  TestCalendar


import UIKit
import JTAppleCalendar

class MainViewController: UIViewController {
    // MARK: property
    let fommatter = DateFormatter()
    let cellID = "CustomCell"
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}

// MARK: JTAppleCalendarViewDataSource
extension MainViewController: JTAppleCalendarViewDataSource {
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        fommatter.dateFormat = "yy MM dd"
        fommatter.timeZone = Calendar.current.timeZone
        fommatter.locale = Calendar.current.locale
        
//        guard let startDate = fommatter.date(from: "2017 01 01") else { return  }
//        guard let endDate = fommatter.date(from: "2017 12 31") else { return }
        let startDate = fommatter.date(from: "2017 01 01")!
        let endDate = fommatter.date(from: "2017 12 31")!
        
        
        let parameter = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameter
    }
    
    
}
// MARK: JTAppleCalendarViewDelegate
extension MainViewController: JTAppleCalendarViewDelegate {
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        guard let validCell = cell as? CustomCell else { return }
        
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: cellID, for: indexPath) as! CustomCell
        cell.dateLB.text = cellState.text
        return cell
    }
    
   
}

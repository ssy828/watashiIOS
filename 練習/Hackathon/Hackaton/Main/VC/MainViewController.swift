
import UIKit
import Firebase
import CountdownLabel

let userCash = "cash"
let userTotalTime = "totalTime"

// MARK: 메인 부분
class MainViewController: UIViewController {
    
    // MARK: UI
    @IBOutlet weak var btnStackView: UIStackView!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var cashLB: UILabel!
    @IBOutlet weak var countDownLB : CountdownLabel!
    
    // MARK: 프로퍼티
    var seconds  = 0
    var cash = 0
    var totalTime = 0
    let timeOnTheFirstButton = 30
    let timeOnTheSecondButton = 60
    let timeOnTheThirdButton = 90
    let timeOnTheFourthButton = 120
    var userButtonTag: Int?
    
    //  MARK: 버튼 액션
    // 버튼을 타이머가 시작되면 없애는 부분? 생각
    @IBAction func buttonAction(_ sender: UIButton) {
        guard let buttonTag = ButtonTag(rawValue: sender.tag) else { return }
        switch buttonTag {
        case .firstButton:
            seconds = minutesToSeconds(minutes: 1)
            userButtonTag = 1
        case .secondButton:
            seconds = minutesToSeconds(minutes: timeOnTheSecondButton)
            userButtonTag = 2
        case .thirdButton:
            seconds = minutesToSeconds(minutes: timeOnTheThirdButton)
            userButtonTag = 3
        case .fourthButton:
            seconds = minutesToSeconds(minutes: timeOnTheFourthButton)
            userButtonTag = 4
        case .startButton:
            if startBtn.isHidden == false{
                timerRunning(TimeInterval(seconds))
                startBtn.isHidden = true
            }
        }
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        UserDefaults.standard.integer(forKey: userCash)
        UserDefaults.standard.integer(forKey: userTotalTime)
        cashLB.text = "\(cash)"
        
    }
    
    // MARK: 분을 초로 계산하는 메소드
    func minutesToSeconds(minutes minuteValue: Int) -> Int
    {
        return minuteValue * 60
    }
    
    // MARK: 카운트다운실행
    func timerRunning(_ seconds: TimeInterval)
    {
        countDownLB.setCountDownTime(minutes: seconds)
        countDownLB.countdownDelegate = self
        countDownLB.start()
    }

}

extension MainViewController: CountdownLabelDelegate {
    // MARK: countdownFinished()
    // 타이머가 끝나고 난 후
    func countdownFinished()
    {
        guard let tag = userButtonTag else { return }
        switch tag  {
        case 1:
            cash += 100
            totalTime += timeOnTheFirstButton
        case 2:
            cash += 300
            totalTime += timeOnTheSecondButton
        case 3:
            cash += 700
            totalTime += timeOnTheThirdButton
        case 4:
            cash += 1000
            totalTime += timeOnTheFourthButton
        default:
            break
        }
        
        cashLB.text = "\(cash)"
        UserDefaults.standard.set(cash, forKey: userCash)
        UserDefaults.standard.set(totalTime, forKey: userTotalTime)
        
        let alertController = Alert.showAlertController(title: "CASH", message: "\(cash)", actionStyle: UIAlertActionStyle.default, cancelButton: false, completion: nil)
        present(alertController, animated: true, completion: nil)
        startBtn.isHidden = false // 메소드가 끝나면 버튼 보이기
    }
    
}

// MARK: ENUM
enum ButtonTag: Int
{
    case firstButton = 1
    case secondButton = 2
    case thirdButton = 3
    case fourthButton = 4
    case startButton = 0
}


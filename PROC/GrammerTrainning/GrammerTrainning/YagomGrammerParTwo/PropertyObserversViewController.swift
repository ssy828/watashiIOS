
// 프로퍼티 감시자
import UIKit
import Foundation

class PropertyObserversViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let myAccount: Account = Account()
        // Account 클래스 타입의 myAccount 인스턴스 생성
        
        myAccount.credit = 1000
        // myAccount인스턴스가 credit프로퍼티에 1000을 할당
       
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


// 구조체와 클래스비교

import UIKit
import Foundation

class TestStructAndClassViewController: UIViewController {
    
    // MARK: -구조체 클래스 비교
    struct BasicInfo
    {
        let name: String
        var age: Int
        // 구조체: 기본적으로 생성되는 멤버와이즈 이니셜아리저 사용함: 구조체의 인스턴스를 생성하고 초기화 할 때
    }
    class Person
    {
        var favoriteColor: String = ""
        var dislikeColor: String = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: -클래스와 구조체 비교
        var ssyInfo: BasicInfo = BasicInfo(name: "ssy", age: 27)
        // 프로퍼티 이름으로 자동생성된 이니셜 라이저를 사용해 구조체타입의 변수 ssyInfo에 할당
        ssyInfo.age = 100
        
        var friendInfo: BasicInfo = ssyInfo
        // 베이직인포타입의 변수 프랜드인포에 ssyInfo를 할당하겠다
        // ssyInfo의 값을 복사하여 할당
        print(ssyInfo.age)
        print(friendInfo.age)
        
        friendInfo.age = 999
//        friendInfo.name = "friend"
        // 위의 한줄이 실행불가인 이유 : 인스턴스생성시 이니셜라이저를 사용하지 않음
        print(friendInfo.age)
        // 100 -> 999ssyInfo의 값을 복사해왔으므로 별개의 값을 가짐
        
 
        let ssy: Person = Person( )
        // 클래스 펄슨의 이니셜라이저를 호출하고 변수에 할당함
        
        let friend: Person = ssy // ssy의 참조를 할당합니다.
        print(ssy.favoriteColor)
        print(friend.favoriteColor)
        
        friend.favoriteColor = "Yellow"
        print(ssy.favoriteColor)
        print(friend.favoriteColor)
        // ssy 참조하는 고소가 friend 참조하는 곳이 같음!
        print(ssy === friend) // true: 둘의 참조 같다
        
        
        // 함수이용해 비교
        chageBasicInfo(ssyInfo)
        print(ssyInfo.age) // 1이 아니고 100이 나옴
        // 파라미터(전달인자)는 값이 복사되어 전달되기 때문에
        // ssyInfo의 값만 전달되는 것!
        
        changePerson(ssy)
        print(ssy.favoriteColor)
        // 전달인자(파라미터)의 ssy의 참조가 전달되기 때문에
        // ssy이 참조하고 있는 값변화!
        
    }

    // MARK: -구조체이용한 함수
    func chageBasicInfo(_ info: BasicInfo)
    {
        var copiedInfo: BasicInfo = info
        copiedInfo.age = 1
    }
    // MARK: -클래스이용한 함수
    func changePerson(_ info: Person)
    {
        info.favoriteColor = "Purple"
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

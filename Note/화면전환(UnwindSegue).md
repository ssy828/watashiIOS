화면 전환
-

- 소스코드 전환
- 스토리 보드 제공 기능

*화면 전환 개념*

1. 뷰 컨트롤러의 위에 다른 뷰 가져와 바꿔치기 : 뷰를 이용한 화면 전환

2. 뷰 컨트롤러에서 다른 뷰 컨트롤러 호출해 화면 전환 : 뷰 컨트롤러 직접 호출 

3. *내비게이션 컨트롤러* 사용해 화면 전환 : 

4. 화면 전환용 객체 *세그웨이* 사용해 화면 전환 : 

--

### 뷰를 이용한 화면 전환  
######-> 가능하면 뷰를 이용한 화면 전환 지양, 뷰 컨트롤러를 이용한 화면 전환방식 선호

-

###뷰 컨트롤러 직접 호출에 의한 환면 전환


*화면 전환 메소드*

```
present(<새로운 뷰컨트롤러 인스턴스>, animated: <애니메이션 여부>)
```
	
```
present(_:animated:completion:) 화면이 전환이 완전히 끝난 후에 호출해주는 역할
```
	
---

 completion: 실행구문을 클로저나 함수형식으로 입력 받음
	
 화면 전환은 때로 시간이 걸리는 작업, 끝나기를 기다리지 않고 다음 라인 코드 이어서 실행시키기 때문에 필요함 
 
######화면 전환 - 비동기식(하나의 처리가 끝나기를 기다리지 않고 다음 일 수행하는 방식)

-
*이전 화면 복구* 

```
dismiss(animated:)

dismiss(animated:completion:)	

```

######기본의 화면을 덮고 있던 새 화면을 걷어냄!! 사라지게 처리하는 건 자신을 띄우고 있는 이전 뷰 컨트롤러

*실제 사용코드*

-첫번째 뷰 컨트롤러

```
import UIKit
class ViewController: UIViewController {

    @IBAction func moveNextVC(_ sender: UIButton) {
        
        // 이동할 뷰 컨트롤러 객체를 스토리 보드 ID 정보를 참조하여 이동
       guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "secondVC") else { return }
       
        // 화면 전환할 애니메이션 타입
        nextVC.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        // 인자값으로 뷰 컨트롤러 인스턴스를 넣고 프레젠트 메소드 호출
        self.present(nextVC, animated: true)
    }

}
```
-두번째 뷰 컨트롤러

```
import UIKit
class SecondViewController: UIViewController {

    @IBAction func previousVC(_ sender: UIButton) {
        // 현재 띄운 뷰 컨트롤러 걷어내기
        self.presentingViewController?.dismiss(animated: true)
    }
}

```

*UIModalTransitionStyle*

	.coverVertical - 기본 적용. 아래에서 위로
	.crossDissovle - 두 화면 서로 교차 하면서 나타남
	.flipHorizontal - 화면 중앙 가상 축을 기준으로 화면이 돌아가는 효과(=flip)
	.partialCurl - 화면의 오른쪽 아래 모서리부터 페이지가 말려 올라가는 효과 

-

###내비게이션 컨트롤러 이용해 화면 전환

*내비게이션 컨트롤러*

- 계층적 성격
- 스택 구조로 관리함
- 내비게이션 스택 - 배열 방식
- 추가: push / 제거: pop

*내비게이션 컨트롤러의 생성*

	// 내비게이션 컨트롤러의 인스턴스를 생성하는 메서드입니다.
	// 매개변수로 내비게이션 스택의 가장 아래에 있는 루트 뷰 컨트롤러가 될 뷰 컨트롤러를 넘겨줍니다.
	init(rootViewController: UIViewController)

*내비게이션 스택의 뷰 컨트롤러에 대한 접근*

	// 내비게이션 스택에 있는 최상위 뷰 컨트롤러에 접근하기 위함
	var topViewController: UIViewController?
	
	// 현재 내비게이션 인터페이스에서 보이는 뷰와 관련된 뷰 컨트롤러에 접근하기 위함
	var visibleViewController: UIViewController?
	
	// 내비게이션 스택에 특정 뷰 컨트롤러에 접근하기 위함(루트 뷰 컨트롤러의 인덱스 0)
	var viewController: [UIViewController]

*내비게이션 스택의 푸시와 팝에 관한 메서드*
	
	// 내비게이션 스택에 뷰 컨트롤러를 푸시
	// 푸시 된 뷰 컨트롤러는 최상위 뷰 컨트롤러로 화면에 표시
	func pushViewController(UIViewController, animated: Bool)
	
	// 내비게이션 스택에 있는 최상위 뷰 컨트롤러를 팝
	// 최상위 뷰 컨트롤러 아래에 있던 뷰 컨트롤러의 콘텐츠가 화면에 표시
	func popViewController(animated: Bool) -> UIViewController?
	
	// 내비게이션 스택에서 루트 뷰 컨트롤러를 제외한 모든 뷰 컨트롤러를 팝
	// 루트 뷰 컨트롤러가 최상위 뷰 컨트롤러가 됨
	// 삭제된 모든 뷰 컨트롤러의 배열이 반환
	func popToRootViewController(animated: Bool) -> [UIViewController]?
	
	// 특정 뷰 컨트롤러가 내비게이션 스택에 최상위 뷰 컨트롤러가 되기 전까지 상위에 있는 뷰 컨트롤러들을 팝
	func popToViewController(_ viewController: UIViewController, 
			animated: Bool) -> [UIViewController]?
		
*네이게이션 뷰 컨트롤러 코드로 작성하는 법*

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
	        // Override point for customization after application launch.
	        
	        // 루트 뷰 컨트롤러가 될 뷰 컨트롤러를 생성
	        let rootViewController = UIViewController()
	        // 위에서 생성한 뷰 컨트롤러로 내비게이션 컨트롤러를 생성
	        let navigationController = UINavigationController(rootViewController: rootViewController)
	        
	        self.window = UIWindow(frame: UIScreen.main.bounds)
	        // 윈도우의 루트 뷰 컨트롤러로 내비게이션 컨트롤러를 설정
	        self.window?.rootViewController = navigationController
	        self.window?.makeKeyAndVisible()
	        
	        return true
	    }

*스토리보드를 사용하여 내비게이션 인터페이스 구성하기*

	1. 스토리보드에서 내비게이션 컨트롤러에 포함할 뷰 컨트롤러를 선택합니다.
	2. 메뉴에서 [Editor] - [Embed In] - [Navigation Controller]를 차례로 선택합니다.
	3. 선택한 뷰 컨트롤러가 내비게이션 컨트롤러의 루트 뷰 컨트롤러가 되면서 내비게이션 컨트롤러가 생성됩니다.
	4. 위의 방법 외에도 객체 라이브러리에서 내비게이션 컨트롤러를 드로그 앤 드롭해서 캔버스에 올릴 경우 테이블 뷰를 포함한 루트 뷰 컨트롤러가 생성되면서 내비게이션 컨트롤러가 만들어집니다.

---
**내비게이션 바 2페이지 이후 부터 생성**

######루트 뷰 컨트롤러 이후 두번째 뷰 컨트롤러에 내비게이션 바가 자동생성 안되므로
	
	1. navigtaion Item 추가
	2. bar button Item 추가
	3. 다른 뷰컨트롤러와 show로 연결 

-
###세그웨이를 이용한 화면 전환

*세그웨이*

- 뷰 컨트롤러 사이의 연결 관계 및 화면 전호나 관리하는 역할

- 직접 연결하는 방식


*주요 프로퍼티*

	var source: UIViewController : 세그에 전환을 요청하는 뷰 컨트롤러
	
	var destination: UIViewController : 전환될 뷰 컨트롤러
	
	var identifier: String? : 세그 객체의 식별자

*주요 메서드*

	func perform() : 뷰 컨트롤러의 전환을 수행합니다.

*세그웨이 방식*

- Action Segue : 버튼이나 테이블 셀의 이벤트 트리거에 의해 자동 연결

- Manual Segue: performSegue(withIdentifier:sender:)

> 전처리 메소드(Pre-Process Method) 
-
> * 세그웨이가 실행되기 전에 값을 저장할 필요가 있거나 경고창을 띄워주는 처리 등등 해야할 경우 전처리 메소드에 해당 내용을 작성하면 됨

> * 그 내용을 세그웨이가 실행되기 전에 자동으로 실행됨
> 
>			prepare(for segue: UIStoryboardSegue, sender: Any?){...} 

> * 호출의 주체 - 시스템 

> ###NSLog 

> - Xcode 디버그 콘솔에 출력 기능
> - 값을 확인 하거나 실행 과정에서 여러 과정을 체크하는 용도로 사용
> 

***Action Segue***

- show 타입: 내비게이션이 없는 경우 Present Modallydhk 같은 방식 / 내비게이션 컨트롤러를 통한 화면 이동 발생
- Present Modally 타입: present 메소드와 같은 역할

***Manual Segue***
performSegue(withIdentifier:<세그웨이 식별자>, sender:<세그웨이 실행 객체>)

	// self 뷰컨트롤러 자기 자신을 의미
	self.performSegue(withIdentifier:"ManualWind",sender: self) 
	
-
###Unwind - 화면 복귀
######참고 p236~

- 이전 화면으로 돌아가는 것 = Unwind
- 새로운 화면으로 전환 하는 것 = Wind
- Unwind: Wind 작업을 해제하고 본래의 화면으로 돌아간다는 뜻
- Exit 아이콘 - Unwind Segue 구현 가능하게 도와줌

=> *Exit 아이콘 연결 - 뷰컨트롤러 B, Unwind Segue 메소드 작성 - 뷰 컨트롤러A*

######뷰 컨트롤러의 인스터스는 하나 이상 존재하면 안됨. 중복 불가.

######참고 p243~
**한꺼번에 여러 페이지 복귀하기**

- 첫번째 뷰컨트롤러에 Unwind Segue 메소드 작성

		import UIKit
		class FirstViewController: UIViewController {
	
	    // Unwind Segue
	    @IBAction func goToHomePage(_ sender: UIStoryboardSegue){ }
	    
	    override func viewDidLoad() {
	        super.viewDidLoad()
	
	        // Do any additional setup after loading the view.
	      }
		}
	
- 마지막 뷰 컨트롤러에서 Home 바버튼을 상단 도크 바에 Exit 아이콘에 드래그 해 Unwind Segue와 연결

>
Unwind Segue 실행 -> 첫번째 뷰컨트롤러 화면이 나타남과 동시에 내비게이션 스택의 중간에 쌓여있던 인스턴스는 메모리에서 모두 삭제됨!(프로그래밍 용어: dealloc)

> **Unwind Segue - 프레젠테이션 방식이나 내비게이션 컨트롤러를 이용한 방식에 구분 없이 실행되는 것이 특징!**

**중간 페이지로 복귀하기**

- Unwind Segue가 향할 대상 뷰 컨트롤러에 메소드를 추가해주기!
	
		import UIKit
		class Page2ViewController: UIViewController {
		
		    // Unwind Segue
		    @IBAction func backToPage2(_ sender: UIStoryboardSegue){ }
		    
		    override func viewDidLoad() {
		        super.viewDidLoad()
		        // Do any additional setup after loading the view.
		    }
		
		}
-
참고 문헌 - 꼼꼼한 재은씨 Swift: 기본편
	
	
	
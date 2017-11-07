##Thread

- 네트워크는 스레드에서 실행 안됨
- 모든 UI 메인 스레드에서 실행
- 메로리 공간을 공유
- UI동작 안하는 경우: 메인 스레드가 많이 사용될 경우
- ios 이벤트 등 큐에 들어감
- 터치이벤트는 큐에 저장됨 아직 처리하는 중일 경우
- 네트워크가 느릴경우: 화면에 아무 변화없음
	-> 네트워크가 갔다오는 시간이 걸리기 때문
- multi core process: cpu 1개에 core가 여러개.
- Multithread(작업을 나눠서 하는 것)
예) 음악청취
	사용자에게 데이터를 입력받는 작업
	네트워크로 데이터를 주고받는 작업 
	프린터로 파일 출력작업 등등
- 블록 = 클로저
- 터치이벤트가 언제 될지 모르므로 비동기!
- 델리게이트 셀렉터 클로저 노티피케이션: 
비동기(어떤 일이 끝나는 것과 상관없이 다음 행동 실행)
- GCD보다는 Operation 사용 권장
- Operation Queue
- Timer도 main스레드에서 사용됨
- Queue를 쓰레드 하나로 볼 것!  (	Queque = Thread )
- work item 1게 = Closure 1개    
(work item: 클로저를 활용해 구현되어 있으며 큐를 생성할때 꼭 같이 만들어야한다!)

--
###Thread 사용 전
	//
	//  ViewController.swift
	//  TestThread
	//
	
	import UIKit
	
	class ViewController: UIViewController {
	
	    
	    @IBOutlet weak var testLB: UILabel!
	    @IBAction func testButton(_ sender: Any) {
	        testLB.text = "change"
	    }
	    
	    // 오랫동안 할 일이 있으면 thread를 돌려야함!
	    func longTimeAction()
	    {
	        var total = 0
	        for n in 1...1000000
	        {
	            total += n
	            print(n)
	        }
	    }
	    
	    override func viewDidLoad() {
	        super.viewDidLoad()
	        // Do any additional setup after loading the view, typically from a nib.
	    }
	
	}

--
### 스레드 사용 후
	//
	//  ViewController.swift
	//  TestThread
	//
	
	import UIKit
	
	class ViewController: UIViewController {
	
	    
	    @IBOutlet weak var testLB: UILabel!
	    @IBAction func testButton(_ sender: Any) {
	        testLB.text = "change"
	    }
	    
	    // 오랫동안 할 일이 있으면 thread를 돌려야함!
	    func longTimeAction()
	    {
	        var count = 0
	        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (t) in
	//            for n in 1...1000000
	//            {
	//                total += n
	//                print(n)
	//            }
	            self.testLB.text = "\(count)"
	            count += 1
	        }
	        
	     
	    }
	    
	    override func viewDidLoad() {
	        super.viewDidLoad()
	        // Do any additional setup after loading the view, typically from a nib.
	        longTimeAction()
	    }
	

	
	}
	
- 이 상태에서 스레드 하나만 일어남!

--
###init할 경우 
		 
		let timer = Timer(timeInterval: TimeInterval, 
	repeats: Bool,
	block: (Timer) -> Void)
		
- block = closure 
- timer.fire()필요: init 할 경우
-> 이건 한번만 사용됨

--
![image](/Users/songyeeshin/Desktop/쓰레드.png)

- 메모리 공간을 공유!!
- 메모리 공간 전체를 복수의 쓰레드가 공유해 리소스 경합 발생하지 않게 주의!

![image](/Users/songyeeshin/Desktop/멀티쓰레드(메모리공간동일).png)
![image](/Users/songyeeshin/Desktop/멀티프로세스(메모리공간별도).png)

- 메인 큐는 직렬. 비동기 작업이여도 직렬로 실행.
- 보통은 메인 스레드에서 어떤 일처리가 끝나기 전에 다른 일처리를 하지 못함    
예를 들어) 음악재생을 준비해줘! 하면 음악준비 일처리를 열중한 나머지 화면처리를 하지 못하게 되므로 화면처리는 메인스레드에서
로딩이나 파일처리는 다른 스레드에서 처리함

- _여러개의 명령을 한번에 처리하도록 하는 것_
- 자주 사용하면 메모리 소모가 커지므로 적절하게 사용!

##DispatchWorkItem

- 이것 대신에 클로저를 많이 사용
- perform VS notify VS execute  
perform: globalr dispatch queue에서 실행   
notify: WorkItem 값을 DispatchQueue.main에 보여주는 기능    
[메인 큐에 대한 정보를 집어넣는다]
자기 작업을 보여주는 기능   
execute: 실행하는 기능 
- 비동기끼리 일때 사용하는 것을 권장(타이밍 이슈일때)

-----
[참고링크입니다](http://brainbackdoor.tistory.com/27)    
참고: 야곰블로그
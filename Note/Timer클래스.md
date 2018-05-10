## Timer

######Timer 클래스는 일정한 시간 간격이 지나면 지정된 메시지를 특정 객체로 전달하는 기능 제공

**Timer 특징**

-타이머는 런 루프(run loops)에서 작동함

-타이머를 생성할 때 반복 여부를 지정

```
비 반복 타이머: 한 번 실행된 다음 자동으로 무효화
  
반복 타이머: 동일한 런 루프에서 특정 TimeInterval 간격으로 실행
 반복되는 타이머 기능을 정지하려면 invalidate() 메서드를 호출해 무효화
 
```

--


*Timer 주요 프로퍼티*

	var isValid: Bool - 타이머가 현재 유효한지 아닌지 여부
	
	var fireDate: Date - 다음에 타이머가 실행될 시각
	
	var timeInterval: TimeInterval - 타이머의 실행 시간 간격(초 단위)
	
--	

*Timer 생성 메서드*

1._타이머 생성과 동시에 _ 런 루프에 *default mode*로 등록하는 클래스 메서드

	class func scheduledTimer(withTimeInterval: TimeInterval, repeats: Bool, block: (Timer) -> Void)
	
	class func scheduledTimer(timeInterval: TimeInterval, target: Any, selector: Selector, userInfo: Any?, repeats: Bool)
	
	class func scheduledTimer(timeInterval: TimeInterval, invocation: NSInvocation, repeats: Bool)
	

2._타이머 생성 후 수동으로_ 타이머 객체를 *add(_:forMode:)* 메서드를 이용해 런 루프에 추가해줘야 하는 메서드

	func init(timeInterval: TimeInterval, invocation: NSInvocation, repeats: Bool)
	
	func init(timeInterval: TimeInterval, target: Any, selector: Selector, userInfo: Any?, repeats: Bool)
	
	func init(fireAt: Date, interval: TimeInterval, target: Any, selector: Selector, userInfo: Any?, repeats: Bool)

--
참고링크: [https://developer.apple.com/documentation/foundation/timer]()

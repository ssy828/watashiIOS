UISlider
--

######연속된 값 중에서 특정 값을 선택하는데 사용되는 컨트롤

*슬라이더와 메서드 연결하는 방법*

- addTarget(_:action:for:) 메서드 사용
- 인터페이스 빌더에서 연결 (@IBAction)

--

*슬라이더와 연결하는 메서드 형식*

```
func doSomething()
func doSomething(sender: UISlider)
func doSomething(sender: UISlider, forEvent event: UIEvent)
```
*슬라이더 주요 프로퍼티*

```
var minimumValue: Float, var maximumValue: Float: 슬라이더 양끝단의 값

var value: Float: 슬라이더의 현재 값

var isContinuous: Bool: 슬라이더의 연속적인 값 변화에 따라 이벤트 역시 연속적으로 호출할 것인지의 여부

var minimumValueImage: UIImage?, var maximumValueImage: UIImage?: 슬라이더 양끝단의 이미지

var thumbTintColor: UIColor?: thumb의 틴트 색상

var minimumTrackTintColor: UIColor?, var maximumTrackTintColor: UIColor?: thumb를 기준으로 앞쪽 트랙과 뒤쪽 트랙의 틴트 색상

```
--

*슬라이더 주요 메서드*

	//  슬라이더의 현재 값 설정
	func setValue(Float, animated: Bool)
	
	//  특정 상태의 minimumTrackImage 반환
	func minimumTrackImage(for: UIControlState) -> UIImage?
	
	// 특정 상태의 minimumTrackImage 설정
	func setMinimumTrackImage(UIImage?, for: UIControlState)
	
	// 특정 상태의 maximumTrackImage 반환
	func maximumTrackImage(for: UIControlState) -> UIImage?
	
	// 특정 상태의 minimumTrackImage 설정
	func setMaximumTrackImage(UIImage?, for: UIControlState)
	
	//  특정 상태의 thumbImage 반환
	func thumbImage(for: UIControlState) -> UIImage?
	
	//특정 상태의 thumbImage 설정
	func setThumbImage(UIImage?, for: UIControlState)
	
--
참고 링크 -
[https://developer.apple.com/documentation/uikit/uislider/]()

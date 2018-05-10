UIButton
--
 메서드와 버튼 연결 방법 
 
  - addTarget(_:action:for:)메서드 사용
  - 인터페이스 빌더 연결(@IBAction)

--

 *버튼과 연결되는 메서드 형식*

```
func doSomething()
func doSomething(sender: UIButton)
func doSomething(sender: UIButton, forEvent event: UIEvent)

```
--
 *버튼 주요 프로퍼티*

```
enum UIButtonType: 버튼의 유형
버튼의 유형에 따라 버튼의 기본적 외형과 동작이 달라짐
처음 버튼을 생성할 때 init(type:) 메서드를 이용 또는 인터페이스빌더의 "Attribute Inspector"에서 버튼 유형 지정가능
한번 생성된 버튼의 유형은 이후 변경 할 수 없습니다.
가장 많이 사용하는 유형은 Custom과 System이지만 필요에 따라 다른 유형(Detail Disclosure, Info Light, Info Dark, Add Contact)를 사용가능
var titleLabel: UILabel?: 버튼 타이틀 레이블
var imageView: UIImageView?: 버튼의 이미지 뷰
var tintColor: UIColor!: 버튼 타이틀과 이미지의 틴트 컬러

```
--

*버튼 주요 메서드*

```
// 특정 상태의 버튼의 문자열 설정
func setTitle(String?, for: UIControlState)

// 특정 상태의 버튼의 문자열 반환
func title(for: UIControlState) -> String?

// 특정 상태의 버튼 이미지 설정
func setImage(UIImage?, for: UIControlState)

// 특정 상태의 버튼 이미지 반환
func image(for: UIControlState) -> UIImage?

// 특정 상태의 백그라운드 이미지 설정
func setBackgroundImage(UIImage?, for: UIControlState)

// 특정 상태의 백그라운드 이미지 반환
func backgroundImage(for: UIControlState) -> UIImage?

// 특정 상태의 문자열 색상 설정
func setTitleColor(UIColor?, for: UIControlState)

// 특정 상태의 attributed 문자열 설정
func setAttributedTitle(NSAttributedString?, for: UIControlState)
```
--



UILabel
--
*레이블 주요 프로퍼티*

	var text: String? - 레이블이 표시할 문자열
	문자열이 모두 동일한 속성(폰트, 색상, 기울임꼴 등)으로 표시
	text 프로퍼티에 값을 할당하면 attributedText 프로퍼티에도 똑같은 내용 문자열이 할당됨
	
	var attributedText: NSAttrbutedString? - 레이블이 표시할 속성 문자열
	NSAttributed 클래스를 사용한 속성 문자열 중 특정 부분의 속성을 변경가능 ([예] 일부 글자 색상 변경/일부 글자 폰트 변경)
	attributedText 프로퍼티에 값을 할당하면 text 프로퍼티에도 똑같은 내용 문자열이 할당됨
	
	var textColor: UIColor! - 문자 색상
	
	var font: UIFont! - 문자 폰트
	
	var textAlignment: NSTextAlignment - 문자열의 가로 정렬 방식
	left, right, center, justified, natural 중 하나 선택
	
	var numberOfLines: Int - 문자를 나타내는 최대 라인 수
	문자열을 모두 표시하는 데 필요한 만큼 행을 사용하려면 0으로 설정 / 기본 값 = 1
	설정한 문자열이 최대 라인 수를 초과하면 lineBreakMode 프로퍼티의 값에 따라 적절히 잘라서 표현함
	adjustsFontSizeToFitWidth 프로퍼티를 활용하면 폰트 사이즈를 레이블의 넓이에 따라 자동으로 조절
	
	var baselineAdjustment: UIBaselineAdjustment -문자열이 Autoshrink 되었을 때의 수직 정렬 방식
	Align Baseline: 문자가 작아졌을 때 기존 문자열의 기준선에 맞춤
	Align Center: 문자가 작아졌을 때 작아진 문자의 중앙선에 맞춤
	None: 문자가 작아졌을 때 기존 문자열의 위쪽 선에 맞춤
	
	var lineBreakMode: NSLineBreakMode: 레이블의 경계선을 벗어나는 문자열에 대응하는 방식
	
	Character wrap: 여러 줄 레이블에 주로 적용되며, 글자 단위로 줄 바꿈을 결정합니다.
	Word wrap: 여러 줄 레이블에 주로 적용되며, 단어 단위로 줄 바꿈을 결정합니다.
	Truncate head: 한 줄 레이블에 주로 적용되며, 앞쪽 텍스트를 자르고 ...으로 표시합니다.
	Truncate middle: 한 줄 레이블에 주로 적용되며, 중간 텍스트를 자르고 ...으로 표시합니다.
	Truncate tail: 한 줄 레이블에 주로 적용되며, 끝쪽 텍스트를 자르고 ...으로 표시합니다. 기본 설정 값입니다.	
![](/Users/songyeeshin/Desktop/UILabel.png)
UITextFieldDelegate
-
####텍스트 필드 객체에서 텍스트의 편집 및 유효성 검사를 관리하는 데 사용하는 선택적 메서드 집합

개요

######텍스트 필드는 중요한 변경에 대한 응답으로 델리게이트의 메소드 호출. 이 메소드를 사용하여 사용자가 입력 한 텍스트의 유효성을 확인하고 키보드와의 특정 상호 작용에 응답하고 전체 편집 프로세스를 제어가능. 텍스트 필드가 첫 번째 응답자가되기 직전에 편집이 시작되고 키보드 (또는 지정된 입력보기)가 표시됨. 

###### ***편집 프로세스의 흐름은 아래와 같음***

>첫 번째 응답자가되기 전에 텍스트 필드는 대리자의 메서드를 호출합니다 . 이 메서드를 사용하여 텍스트 필드의 내용 편집을 허용하거나 금지합니다.textFieldShouldBeginEditing(_:)

>텍스트 필드가 첫 번째 응답자가 됨.

>이에 따라 시스템은 키보드 (또는 텍스트 필드의 입력보기)를 표시하고 필요에 따라 알림 및 알림을 게시.
>**keyboardWillShowNotification and keyboardDidShowNotification**
> 
>키보드 또는 다른 입력보기가 이미 표시된 경우 시스템은 알림 및 알림을 대신 게시. 
>**keyboardWillChangeFrameNotification and keyboardDidChangeFrameNotification**

>텍스트 필드는 대리자의 메서드를 호출하고 알림을 게시.
>
>**textFieldDidBeginEditing(_:) and 
>textDidBeginEditingNotification**

>텍스트 필드는 편집하는 동안 다양한 대리자 메서드를 호출.

>현재 텍스트가 변경 될 때마다 메서드를 호출 하고 알림을 게시.
>**textField(_:shouldChangeCharactersIn:replacementString:)textDidChangeNotification**

>사용자가 내장 된 단추를 눌러 텍스트를 지울 때 메서드를 호출.
>**textFieldShouldClear(_:)**

>사용자가 키보드의 리턴 버튼을 누를 때 메소드를 호출.
>**textFieldShouldReturn(_:)**

>첫 번째 응답자로 사직하기 전에 텍스트 필드는 해당 대리인의 메서드를 호출. 이 메서드를 사용하여 현재 텍스트의 유효성을 검사.
>**textFieldShouldEndEditing(_:)**

>텍스트 필드는 첫 번째 응답자로 사임합니다.

>이에 따라 시스템은 필요에 따라 키보드를 숨기거나 조정. 키보드를 숨기면 시스템이 및 통지를 게시.
>**keyboardWillHideNotification and keyboardDidHideNotification**

>텍스트 필드는 대리자의 메서드를 호출하고 알림을 게시.
>
>**textFieldDidEndEditing(_:) and 
>textDidEndEditingNotification**

---
##### 편집관리
>**func textFieldShouldBeginEditing(UITextField) -> Bool**
>지정된 텍스트 필드에서 편집을 시작해야하는 경우 대리인에게 요청합니다.

>**func textFieldDidBeginEditing(UITextField)**
>지정된 텍스트 필드에서 편집이 시작되었음을 대리인에게 알립니다.

>**func textFieldShouldEndEditing(UITextField) -> Bool**
지정된 텍스트 필드에서 편집을 중지해야하는 경우 대리인에게 요청합니다.

>**func textFieldDidEndEditing(UITextField, reason: UITextField.DidEndEditingReason)**
>지정된 텍스트 필드에 대해 편집이 중지되었음을 대리인에게 알립니다.
>
**func textFieldDidEndEditing(UITextField)**

>지정된 텍스트 필드에 대해 편집이 중지되었음을 대리인에게 알립니다.
>
>**enum UITextField.DidEndEditingReason**
>
>텍스트 필드에서 편집이 끝난 이유를 나타내는 상수.

##### 텍스트 필드의 텍스트 편집하기

>**func textField(UITextField, shouldChangeCharactersIn: NSRange, replacementString: String) -> Bool**
>
>지정된 텍스트를 변경해야하는 경우 대리자에 요청합니다.
>
**func textFieldShouldClear(UITextField) -> Bool**
>
>텍스트 필드의 현재 내용을 제거해야하는 경우 대리인에게 요청합니다.
>
**func textFieldShouldReturn(UITextField) -> Bool**

>텍스트 필드가 반환 버튼 누르기를 처리해야하는 경우 대리인에게 요청합니다.
>

-

NumberFormatter 
-
####숫자 값과 텍스트 표현 사이를 변환.


 * 정수,부동 소수점 및 복식 포함
 * 셀이 수용할 수 있는 숫자 값에 범위를 지정가능 
 * 숫자의 0이 아닌 소수 부분을 표시 할 수있는 옵션을 제공
 * 유효 자릿수를 표시하도록 구성 가능: ***usesSignificantDigits***
 
##### 숫자의 지역화 관리
> **var localizesFormat: Bool**
> 
> 달러 기호($), 소수 구분 문자 ( .) 및 천 단위 구분 문자 ( ,)가 사용자의 현지화 된 문자로 변환하는지 여부 판별


##### 통화 형식 구성
>**var currencySymbol: String!**

>리시버가 현지 통화 기호로 사용하는 문자열입니다.

>**var currencyCode: String!**
>
수신자의 통화 코드.

##### 정수 및 소수 자릿수 구성

>**var minimumIntegerDigits: Int**
>
>소수점 이하 자리수의 최소치.

>**var maximumIntegerDigits: Int**

>소수점 앞에 오는 최대 자릿수입니다.

>**var minimumFractionDigits: Int**
>
>소수점 이하의 자리수의 최소치.

>**var maximumFractionDigits: Int**
>
>소수점 이하의 최대 자리수입니다.

##### 중요한 자릿수 구성

>**var usesSignificantDigits: Bool**
>
>포맷터가 숫자 서식을 지정할 때 최소 및 최대 유효 자릿수를 사용하는지 여부를 나타내는 부울 값입니다.

>**var minimumSignificantDigits: Int**
>
>숫자 포맷터의 최소 유효 자릿수입니다.

>**var maximumSignificantDigits: Int**
>
>숫자 포맷터의 최대 유효 자릿수입니다.





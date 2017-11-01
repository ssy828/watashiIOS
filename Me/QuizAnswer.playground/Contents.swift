//: Playground - noun: a place where people can play

func checkLeap(year: Int) -> Bool {
    if year % 4 == 0 && (year % 100 != 0 || year % 400 == 0){
        print("윤년입니다.")
        return true
    }else {
        print("윤년이 아닙니다.")
        return false
    }

}

// revers 함수
func revers(num:Int) -> Int
{
  
    var returnValue: String = ""
    var number = num
    
    while ((number/10) >= 0) && (number != 0)
    {
        let lastNum = number%10  // 바꿀 변수가 아니라면 상수로 설정해라!! var -> let 으로 바꿈
        returnValue = returnValue + "\(lastNum)"
        number = number/10
    }
    
    return Int(returnValue)!
}

//자리수 더하기 문제
func addAllDigit(num :Int) -> Int {
    
    var num = num  // 중복이 되면 num 변수만 사용가능
    
    // 강사님 추가
    // 음수로 했을 경우
    var isNe: Bool = false
    if num < 0
    {
        isNe = true
        num *= -1 // num = num * -1
    }

    var positionNumber = 0  // 여기가 양수양수!
    
    while num > 0 {
        positionNumber += num % 10
        num = num / 10
        
    }
    
    // 이부분은 이해 안됨
    if isNe { // isNe == true
        positionNumber *= -1
    }
    
    return positionNumber
    
}
var check1 = addAllDigit(num: 5792)
print(check1)









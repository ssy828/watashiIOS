//: Playground - noun: a place where people can play

//// 1. 윤년 문제
//
//func check(leapYear: Int) -> String
//{
//    var returnValue: String = ""
//    if leapYear%4 == 0
//    {
//        if leapYear%100 != 0 || leapYear%400 == 0
//        {
//            returnValue = "\(leapYear)년은 윤년입니다."
//        }
//        else
//        {
//            returnValue = "\(leapYear)년은 윤년아닙니다."
//        }
//    
//    }else{
//        returnValue = "\(leapYear)년은 윤년아닙니다."
//    }
//    
//    return returnValue
//}
//print(check(leapYear: 2000))

// 각자리수 더하는 함수
func div(num: Int) -> Int
{
    let ten: Int = 10
    var resultValue: Int = 0
    resultValue = num%ten
    return resultValue
}
print(div(num: 123))

//func addAllDigit(num: Int ) -> Int
//{
//    var a:Int = 0
//    if num%10 > 0 {
//        
//    }
//    
//    return a
//}





import Foundation

//func check(number: Int)
//{
//    for element in 1...number{
//        print(element)
//    }
//}
//check(number: 7)




/*
 strToInt 메소드는 String형 str을 매개변수로 받습니다.
 str을 숫자로 변환한 결과를 반환하도록 strToInt를 완성하세요.
 예를들어 str이 "1234"이면 1234를 반환하고, "-1234"이면 -1234를 반환하면 됩니다.
 str은 부호(+,-)와 숫자로만 구성되어 있고, 잘못된 값이 입력되는 경우는 없습니다.
 
 
 
 */



func strToInt(str: String?)
{
    var resultValue: Int = 0
    if let strToInt = str{
        //print(strToInt)
        resultValue = Int(strToInt)!// 가드 렛을 쓸 것!
    }

    print(resultValue)

}

 strToInt(str: "+1234")

//func strToInt(str: String) -> Int
//{
//    guard let tempStr:String = str else {return}
//    var resultValue: Int = 0
//    resultValue = Int(tempStr)
//    return resultValue
//}


//print(strToInt(str: "1234"))


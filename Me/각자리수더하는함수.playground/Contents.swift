//: Playground - noun: a place where people can play

// 재귀함수(각 자리수 더하는 함수)

func addAllDigit(number: Int) -> Int
{
    var num = number
    var sum: Int = 0
    while num%10 > 0
    {
      sum += num%10
      num = num/10
    }
//    for num in 1...3 {
//        sum += number%10
//        num = num/10
//    }
    return sum
}
print(addAllDigit(number: 123))


//func addAllDigit(number: Int) -> String
//{
//    var divValue: String = ""
//    divValue = "\(number%10)"
//    //divValue = "\(divValue/10)"
//    
//    return divValue
//}
//print(addAllDigit(number: 123))

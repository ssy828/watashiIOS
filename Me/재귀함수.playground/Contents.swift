//: Playground - noun: a place where people can play
func addAllDigit(number: Int) -> Int
{
    var num = number // 입력받은 숫자를 저장할 변수
    var sum: Int = 0 // 나머지를 합할 변수
    while num%10 > 0  // 조건: 자릿수가 0이 되기전에
    {
        sum += num%10 // 나머지를 합한 것 : 자릿수
        num = num/10  // 몫 // num /= 10 : 자릿수에 있는 숫자를 없애기 위해서
    }
    //    for num in 1...3 {
    //        sum += number%10
    //        num = num/10
    //    }
    return sum
}
print(addAllDigit(number: 5792))




//: Playground - noun: a place where people can play

func revers(number: Int) -> String
{
    var num = number
    var str: String = ""
    while num%10 > 0 {
        str += String(num%10)
        // String타입으로 변환하려고 쓴 것
        // str = str + num%10
        num = num/10
        
    }
    return str
}
print(revers(number: 1515))

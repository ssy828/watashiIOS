//: Playground - noun: a place where people can play

// 요일 구하기
func getWeekDay(atMonth: Int, day: Int) -> String{
    
    var resultValue: String = " "
    var weekDayArray: [String] = ["일","월","화","수","목","금","토"]
    var dayArray: [Int] = [31,28,31,30,31,30,31,31,30,31,30,31]
    var sum: Int = day // 입력한 달전까지 일수를 더한 값을 저장하는 변수 
    // day로 받은 값을 sum에 저장하려함.
    for i in 0..<atMonth-1 {
        sum = sum + dayArray[i] // sum += dayArray[i]
        //print(sum)
    }
    // sum = sum + day// 입력한 달 전까지 더하고 남은 일수를 더한 값을 저장
    // sum += day
    // sum = sum + 6 // sum += 6 // 배열 인덱스에 맞추기 위해서
    // 이걸 안쓰면 인덱스1[1]이 일요일이고 원래 인덱스0[0]은 일요일로 저장되므로 요일이 안맞음
    let dayDiv = (sum-1)%7// 이부분에서 막힘. // 나머지를 변수에 저장
    // sum-1은 7로 나눴을 때 나머지가 0~6이 나올 수 있으므로
    // sum-1을 먼저 계산하고 해야함 sum%7-1을 할 경우: 나머지가 0을 빼면 -1이 되어버림
    resultValue = weekDayArray[dayDiv] // 나머지를 저장한 변수를 인덱스로 사용해 배열 사용
    
    return resultValue  //print함수만 사용한 것이 아니고 리턴값을 이용했으므로
    
    
}
print(getWeekDay(atMonth: 2, day: 1)) // 프린트함수를 이용해 함수를 출력하는 것

// 너무 어렵다.
// 알고리즘을 뭘 어떻게 해야할지...
// 틀을 잡지도 못함. 
// 누구한테 힌트를 받아야지 가능함.


//public class DayOfWeek {
//    public static func getDayOfWeek(month: Int, day: Int) -> Int {
//        var daysPerMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
//        var sum = 0
//        for i in 0..<(month - 1) {
//            sum += daysPerMonth[i]
//        }
//        sum += day
//        sum += 5 // 01.01.2017 is sunday -> requires 5 more day from (01.01.2017)
//        return sum % 7
//    }
//}
//
//print(DayOfWeek.getDayOfWeek(month: 5, day: 4))
//[출처] [Swift] 2017 년 요일 구하기|작성자 코더



// 중복 숫자 줄이기

// 소수찾기

// 시저암호




















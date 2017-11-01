
// 클로저를 통한 프로퍼티 기본값 세팅
import Foundation

struct Student
{
    var name: String?
    var number: Int?
}

class SchoolClass
{
    var students: [Student] = {
        // 새로운 인스턴스를 생성 사용자정의 연산 후 반환!
        // 스투던트 프로퍼티는 스투던트 구조체의 인스턴스를 요소로 가지는 배열타입
    
        var arr:  [Student] = [Student]()
        
        for num in 1...15 {
            var student: Student = Student(name: nil, number: num)
            arr.append(student)
            // 스쿨 클래스의 인스턴스를 초기화시 students프로퍼티의 기본값을 제공하기위해 클로저가 동작
            // 1~15번까지 학생 생성해 배열에 할당
        }
        return arr
    }() //클로저 뒤에 소괄호 붙은 이유: 클로저를 실행한 결과값은 프로퍼티의 기본값이므로!!
}

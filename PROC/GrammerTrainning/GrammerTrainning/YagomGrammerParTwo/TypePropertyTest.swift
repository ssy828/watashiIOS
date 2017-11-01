//
// 타입 프로퍼티
import Foundation

class TEST
{
    var name: String
    var age: Int
    init(name: String, age: Int) {
        if 4 > name.count  {
            print("4글자 이내로 썼군요!")
        }
        
        if 25<age {
            print("25살이상")
        }
        self.name = name
        self.age = age
    }
}

class Aclass
{
    // 저장타입 프로퍼티
    static var typeProperty: Int = 0
    
    // 저장 인스턴스 프로퍼티
    var instanceP: Int = 0{
        didSet{
            Aclass.typeProperty = instanceP + 100
        }
    }
    
    // 연산 타입 프로퍼티
    static var typeComputedP: Int{
        get{
           return typeProperty
        }
        
        set{ // 매개변수 이름 설정안해서 newValue로 설정됨
            typeProperty = newValue
        }
    }
}

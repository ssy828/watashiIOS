
// 싱글턴 패턴

### Singleton Pattern
- 클래스의 인스턴스가 만들어지고 어디서든지 그 인스턴스에 접근할 수 있는 것
- 싱글톤사용이유:
1. 유일한 인스턴스 제어
2. 메모리 공간 절약
 하나의 인스턴스만 생성하므로 객체 생성 횟수 줄어듦
- 인스턴스를 생성하게 되면 Heap에 저장되고 그 인스턴스를 가르키는 변수는 Stack에 저장됨
- 전역변수와 다른점: 
- 전역변수: 프로그램 실행되자마자 메모리에 쌓임
 프로그램 중간에 사용될때만 객체가 만들어져 사용됨
- 호출 할때 최초로 생성하고 계속 최초로 생성된 것을 사용하는 것!

```
// MARK: -singleton patttern
class singletonTest
{
    static let one = singletonTest()
    private init()
    {
        
    }
}

// MARK: -static 설명!
class test
{
//    let name = "ssy"
    static let name = "ssy"
    // App이 생성되기전에 미리 만들어 넣고 그것의 주소를 가져오는 것!
   
    // 외부에서 이 클래스의 인스턴스를 생성하지 못하게 막음!
    private init()
    {

    }
}
// 호출되기전에 미리 3byte 생성해주고

// static이 없으면 3byte씩 사용함
var a = test.name
var b = test.name
```




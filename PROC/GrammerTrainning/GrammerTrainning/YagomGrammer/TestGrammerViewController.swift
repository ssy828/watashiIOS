//
//  TestGrammerViewController.swift
//  GrammerTrainning
//
//  Created by SONGYEE SHIN on 2017. 10. 2..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class TestGrammerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        let s: TupleTest = TupleTest( )
//        // 튜플테스트 라는 이름의 클래스 이니셜라이저를 호출하고 s라는 이름의 상수에 할당함.
//        s.Chek() // s인스턴스가 튜플테스트 클래스의 메소드를 호출함!
//        // 클래스의 이니셜라이저를 통해 메모리에 할당되고 초기화된 객체를 인스턴스라함!
//
//        let arrTest: ArrayTest = ArrayTest( )
//        arrTest.check()
//
//        let test: DictionaryTest = DictionaryTest( )
//        test.check()
//
        
//        let test: SetTest = SetTest()
//        test.check()
//        test.ck()
//
//        let lion2: Animal = Animal.lion  // 같은 타입인 Animal 내부의 항목으로만 lion2의 값을 변경가능!
//        print(lion2)
//
//        let tiger2: Animal1 = Animal1.tiger
//        print(tiger2.rawValue) // 특정타입으로 원자값을 지정함!
//
//        let a: TupleSwitchCaseTest = TupleSwitchCaseTest()
//        a.chk()
//
//        let b: LoopTest = LoopTest()
//        b.chk()
//        b.checkCharater()
//
        /////////////////////////////////////////////
        // 옵셔널연습
        let c: OptionalTest = OptionalTest()
        var myName: String? = "ssy"
        c.checkOptionalValue(value: myName) // 값이 있으므로
        myName = nil
        c.checkOptionalValue(value: myName) // 값이 없으므로
        c.check() // c인스턴스가 옵셔널테스트클래스 안에 있는 체크 메소드 호출
        c.forceUnwrapping()
        c.chkOptinalBinding() 
        c.optionalBinding()
        
        // 옵셔널 체이닝 연습
        let ssy: Person = Person()
        // 그러나 Person클래스의 프로퍼티 residence는 Residence클래스를 옵셔널타입으로 상속?
        // residence에는 값이 있을 수도 없을 수도 있다
        // 현재 ssy의 residence의 값은 nil <- 옵셔널 타입은 초기화히지 않으면 nil로 초기화됨!
        if let roomCount = ssy.residence?.numberOfRooms{
            // if문 실행: ssy.residence = Residence()
            // Person클래스타입의 인스턴스가 Person클래스 내의 프로퍼티인 residence에 Residence클래스 타입의 인스턴스를 할당??
            // 더 이상 nil이 아니므로 if문 실행
            print("ssy's residence has \(roomCount)rooms")
        }else{
            print("Unable to retrieve the number of rooms")
        } // 현재 else 부분 실행 : ssy의 residence가 nil이므로
        
       
//        // 알고리즘 테스트
//        let n: InputNumberTest = InputNumberTest()
//        n.check(number: 7)
        
        
        
    }
    
    

  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

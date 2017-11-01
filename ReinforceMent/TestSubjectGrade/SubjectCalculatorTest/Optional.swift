//
//  Optional.swift
//  SubjectCalculatorTest
//
//  Created by SONGYEE SHIN on 2017. 10. 12..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import Foundation

class A {
    
    var b: B?
}

class B {
    var c: C?
}

class C {
    var final: Int?
}

class foo {
    
    func foo() {
        
        
        let aClass = A()
        let bClass = B()
        let cClass = C()
        
        aClass.b = bClass
        bClass.c = cClass
        
        if let b = aClass.b {
            if let c = b.c {
                if let final = c.final {
                    
                }
            }
        }
        
        if let final = aClass.b?.c?.final {
            
        }
    }
}



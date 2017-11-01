//: Playground - noun: a place where people can play

// 별

//func starTangle(line: Int )  {
//    
//    for i in 1..<line {
//        
//        var str: String = " "
//        
//        for _ in 0..<line-i{
//            
//            str = str + " " // str += " "
//            
//        }
//        for k in 0..<line-1{
////            var star: String = "*"
////            print(star)
//            str = str + "*"
//            print(str)
//            
//        }
//        // print("--------")
//    }
//}

//starTangle(line: 5)


func starTangle(line: Int) {
    
    for i in 1..<line {
        var starStr: String = " "
        for j in 1...line-i {
            starStr = starStr + " "
           // print(starStr)
        }
        
        for k in 1...(2*i)-1 {
            starStr = starStr + "*"
            //print(starStr)
        }
        print(starStr)
    }
    
}

starTangle(line: 7)



//func starLine(line: Int) {
//    
//    for i in 1...line{
//        var star: String = " " //별이 찍히는 개수가 리셋되어야하므로 여기에 선언
//        for j in 1...(2*i)-1 { // 줄 개수만큼 찍힐라면 i만 찍어야함
//            star = star+"*"
//            
//        }
//        print(star)
//    }
//    
//}
//starLine(line: 4)


//
//  TypePropertyViewController.swift


import UIKit

class TypePropertyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var test: TEST = TEST(name: "ssy", age: 30)
        
        // MARK: -인스턴스 생성과 소멸 부분: 클로저를 통한 프로퍼티 기본값 세팅
        let myClass: SchoolClass = SchoolClass()
        print(myClass.students.count)
        
        // MARK: -디이니셜라이저활용
        var fileManager: FileManager? = FileManager(fileName: "abc.txt")
        
        // 옵셔널바인딩: 값이 있는 경우 : 그 값을 어떻게 사용할지
        if let manager: FileManager = fileManager{
            manager.openFile()
            manager.modifyFile()
        }
        
        fileManager = nil
        // Deinit instatnce
        // Write File: abc.txt
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

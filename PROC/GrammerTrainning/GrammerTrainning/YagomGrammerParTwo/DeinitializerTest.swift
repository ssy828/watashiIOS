// 디이니셜 라이저 - 인스턴스 소멸
// FileManager 클래스의 디이니셜 라이저 활용

import Foundation

class FileManager
{
    var fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func openFile()
    {
        print("Open File: \(self.fileName)")
    }
    
    func modifyFile()
    {
        print("Modify File: \(self.fileName)")
    }
    
    func writeFile()
    {
        print("Write File: \(self.fileName)")
    }
    
    deinit {
        print("Deinit Instance")
        self.writeFile()
    }
}

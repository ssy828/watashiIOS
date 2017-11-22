
import Foundation
import UIKit


extension UIImageView {
  
  func setImageFromURL(_ url: String) {
    
    let url = URL(string: url)!
    let session = URLSession.shared
    let task = session.dataTask(with: url) { (data, response, error) in
      
      if error != nil {
        return
      }
      
      let image = UIImage(data: data!)
      
      DispatchQueue.main.async {
        self.image = image
      }
      
    }
    task.resume()
  }
}



import Firebase
import UIKit

class SplashViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    /*if let token = UserDefaults.standard.string(forKey: "FirebaseUserToken") {
        Auth.auth().signIn(withCustomToken: token) { user, error in
            let segueIdentifier: String =
                (user != nil) ? "segueSplashToMain" : "segueSplashToLogin"
            
            self.performSegue(withIdentifier: segueIdentifier, sender: nil)
        }
    }*/
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
        self.performSegue(withIdentifier: "segueSplashToLogin", sender: nil)
    }
  }
}


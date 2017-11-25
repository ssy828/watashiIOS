
import Firebase
import UIKit
import SwiftKeychainWrapper

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
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        if  let data = KeychainWrapper.standard.data(forKey: "account"),
            let account = try? JSONDecoder().decode(Account.self, from: data) {
            Auth.auth().signIn(withEmail: account.email, password: account.password) { (user, error) in
                if error == nil, user != nil {
                    self.performSegue(withIdentifier: "segueSplashToMain", sender: nil)
                } else {
                    KeychainWrapper.standard.removeObject(forKey: "account")
                    self.performSegue(withIdentifier: "segueSplashToLogin", sender: nil)
                }
            }
        } else {
            self.performSegue(withIdentifier: "segueSplashToLogin", sender: nil)
        }
    }
  }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        self.performSegue(withIdentifier: "segueSplashToLogin", sender: nil)
    }
}

struct Account: Codable {
    var email: String
    var password: String
}


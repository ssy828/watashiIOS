import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    
    navigationBarAppearance()
    
    return true
  }
  
  // MARK: Appearance
  
  func navigationBarAppearance() {
    UINavigationBar.appearance().shadowImage = UIImage()
    UINavigationBar.appearance().tintColor = .white
    UINavigationBar.appearance().isTranslucent = false
  }

}


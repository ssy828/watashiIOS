
import Foundation

struct Account: Codable {
    var email: String
    var password: String
}

struct FBAccount: Codable  {
    var email: String?
    var id: String
}
struct User {
    var email: String
    var password: String
    var token: String
    var nickname: String
}

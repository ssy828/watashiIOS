
import Foundation

struct Post: Decodable {
  
  let title: String
  var content: String?
  var imageURL: String?
  
  enum CodingKeys: String, CodingKey {
    case title
    case content
    case imageURL = "img_cover"
  }
  
}

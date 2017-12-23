
struct Todays: Decodable {
  
  let dateTitle: String
  let title: String
  let items: [Today]
  
  enum CodingKeys: String, CodingKey {
    case dateTitle = "section_title"
    case title = "section_date"
    case items
  }
}


struct Today: Decodable {
  
  let title: String
  let subTitle: String
  let imageName: String
  let avatarImageName: String
  
  enum CodingKeys: String, CodingKey {
    case title
    case subTitle = "subtitle"
    case imageName = "image_name"
    case avatarImageName = "avatar_image_name"
  }
  
}



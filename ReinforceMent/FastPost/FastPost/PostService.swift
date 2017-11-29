import Foundation
import Alamofire

struct PostService {
  
  static func fetchPosts(completion: @escaping (Bool, [Post]?) -> Void) {
    
    let url = URL(string: "http://api-ios-dev.ap-northeast-2.elasticbeanstalk.com/api/post/")!
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "GET"
    urlRequest.setValue("Token e40c3558e8fc12d5bbed3fea385cc3000667d199", forHTTPHeaderField: "Authorization")
    
    let session = URLSession.shared
    let task = session.dataTask(with: urlRequest) { data, response, error in
      
      if error != nil {
        completion(false, nil)
        return
      }
      
      let statusCode = (response as! HTTPURLResponse).statusCode
      
      switch statusCode {
      case 200:
        
        let model = try! JSONDecoder().decode([Post].self, from: data!)
        completion(true, model)
        return
      default:
        
        completion(false, nil)
        return
      }
      
    }
    task.resume()
    
  }
  
  
  static func fetchWithAlamofire(compltion: @escaping ([Post]?) -> Void){
    
    let url = URL(string: "http://api-ios-dev.ap-northeast-2.elasticbeanstalk.com/api/post/")!
    
    Alamofire
      .request(url)
      .validate(statusCode: 200..<400)
      .responseData { response in
        switch response.result {
        case .success(let value):
          let model = try! JSONDecoder().decode([Post].self, from: value)
          compltion(model)
        case .failure(let error):
          compltion(nil)
        }
      }
    
    
  }
  
  static func uploadPost(
    title: String,
    image: UIImage?,
    compltion: @escaping (Bool) -> Void
  ) {
    
    let url = URL(string: "http://api-ios-dev.ap-northeast-2.elasticbeanstalk.com/api/post/")!
    
    
    let parameters: HTTPHeaders = [
      "Authorization": "Token e40c3558e8fc12d5bbed3fea385cc3000667d199",
    ]
    
    Alamofire
      .upload(
        multipartFormData: { multipart in
          if let textData = title.data(using: .utf8) {
            multipart.append(textData, withName: "title")
          }
          
          if let imageData = UIImageJPEGRepresentation(image!, 0.3) {
            multipart.append(
                imageData,
                withName: "img_cover",
                fileName: "img_cover.jpeg",
                mimeType: "image/jpeg"
            )
          }
          
        },
        to: url,
        method: .post,
        headers: parameters) { encodingResult in
         
          switch encodingResult {
          case .success(let request, _, _):
            request.response(
              completionHandler: { response in
                print(response)
                compltion(true)
              })
          case .failure(let error):
            print(error)
            compltion(false)
          }
        }
    
    
  }
  
  
}


import Foundation

struct TodayService {
  
  // MARK: Fetch
  static func fetch(completion: (DataResponse<[Todays]>) -> Void) {
    
    guard let plistURL = Bundle.main.url(
      forResource: "TodayPropertyList",
      withExtension: "plist"
    ) else { return }
    
    do {
      let data = try Data(contentsOf: plistURL)
      let todays = try PropertyListDecoder().decode([Todays].self, from: data)
      let dataResponse = DataResponse<[Todays]>(
        data: data,
        result: .success(todays)
      )
      completion(dataResponse)
      
    } catch (let error) {
      let errorRespond = DataResponse<[Todays]>(
        data: nil,
        result: .failure(error)
      )
      completion(errorRespond)
    }
  
  }
  
}

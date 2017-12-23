
import Foundation


extension DataResponse {

  func flatMapResult<T>(_ transform: (Value) -> Result<T>) -> DataResponse<T> {
    switch self.result {
    case .success(let value):
      return DataResponse<T>(
        data: self.data,
        result: transform(value)
      )
    case .failure(let error):
      return DataResponse<T>(
        data: nil,
        result: .failure(error)
      )
    }
  }

  func mapResult<T>(_ transform: (Value) -> T) -> DataResponse<T> {
    return self.flatMapResult { value in
      return .success(transform(value))
    }
  }

}


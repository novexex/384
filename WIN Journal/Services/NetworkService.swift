
import Foundation
import UIKit

final class NetworkService {
    func oneOfZero(urlString: String,
                   key: String,
                   completion: @escaping (Result<Bool, Error>) -> Void) {
        
        guard let url = URL(string: urlString),
              UIApplication.shared.canOpenURL(url) else {
            completion(.failure(NetworkError.badUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8",
                         forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(DeviceService.collectedData)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            let result: Result<Bool, Error>
            
            defer {
                completion(result)
            }
            
            if let error {
                result = .failure(error)
                return
            }
            
            guard let data else {
                result = .failure(NetworkError.noData)
                return
            }
            
            guard let jsonDictionary = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                result = .failure(NetworkError.jsonConvert)
                return
            }
            
            if StorageService.shared.isOneOfZero == false {
                result = .success(false)
            } else if let value = jsonDictionary[key] as? Bool, self.isDateValid {
                result = .success(value)
            } else {
                result = .success(true)
            }
        }
        .resume()
    }
    
    private var isDateValid: Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        guard let date = dateFormatter.date(from: Constants.datePost) else { return false } // converting string to date
        let calendar = Calendar.current
        guard let threeDaysAfterDatePost = calendar.date(byAdding: .day,
                                                         value: 3,
                                                         to: date) else { return false } // appending three days from datePost
        let now = Date()
        return threeDaysAfterDatePost <= now
    }
}

private extension NetworkService {
    enum NetworkError: Error {
        case noData
        case jsonConvert
        case jsonValue
        case badUrl
        case date
    }
}

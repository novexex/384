
import Foundation
import UIKit

final class NetworkService {
    func oneOfZero(urlString: String,
                   key: String,
                   timeoutInterval: TimeInterval,
                   completion: @escaping (Result<Bool, Error>) -> Void) {
        
        guard let url = URL(string: urlString),
              UIApplication.shared.canOpenURL(url) else {
            completion(.failure(NetworkError.badUrl))
            return
        }
        
        var request = URLRequest(url: url, timeoutInterval: timeoutInterval)
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
                if let error = error as? URLError,
                    error.code == .timedOut {
                    result = .failure(NetworkError.timeout)
                } else {
                    result = .failure(error)
                }
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
            } else if let value = jsonDictionary[key] as? Bool {
                result = .success(value)
            } else {
                result = .success(true)
            }
        }
        .resume()
    }
}

private extension NetworkService {
    enum NetworkError: Error {
        case noData
        case jsonConvert
        case jsonValue
        case badUrl
        case date
        case timeout
    }
}

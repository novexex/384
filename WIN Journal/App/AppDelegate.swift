
import UIKit
import ApphudSDK
import AppMetricaCore
import OneSignalFramework

final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        oneOfZero()
        Apphud.start(apiKey: "app_abbtayREmLH8uVPuzP9euJkEtSiZJW")
        
        return true
    }
    
    private func oneOfZero() {
        let networkService = NetworkService()
        
        networkService.oneOfZero(urlString: Constants.oneOfZeroUrl,
                                 key: Constants.oneOfZeroKey) { result in
            switch result {
            case .success(let success):
                StorageService.shared.isOneOfZero = success
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

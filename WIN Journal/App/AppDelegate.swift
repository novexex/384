
import UIKit
import ApphudSDK
import OneSignalFramework
import YandexMobileMetrica
import Firebase

final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
//        oneOfZero()
//        OneSignal.initialize(Constants.oneSignalApiKey)
//        OneSignal.login(Apphud.userID())
//        let configuration = YMMYandexMetricaConfiguration(apiKey: Apphud.userID())
//        YMMYandexMetrica.activate(with: configuration!)
//        Apphud.start(apiKey: Constants.appHudApiKey)
        FirebaseApp.configure()
        
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        StorageService.shared.isFirstLaunch = false
    }
    
    private func oneOfZero() {
        let networkService = NetworkService()
        
        networkService.oneOfZero(urlString: Constants.oneOfZeroUrl,
                                 key: Constants.oneOfZeroKey,
                                 timeoutInterval: 7) { [firebase] result in
            switch result {
            case .success(let answer):
                DispatchQueue.main.async {
                    StorageService.shared.isOneOfZero = answer
                }
            case .failure(let error):
                print(error.localizedDescription)
                
                if let error = error as? URLError,
                   error.code == .timedOut {
                    firebase()
                }
            }
        }
    }
    
    private func firebase() {
        let remoteConfig = RemoteConfigService()
        remoteConfig.fetchRemoteConfig(shouldUpdateValues: true)
    }
}

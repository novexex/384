
import FirebaseRemoteConfigInternal

final class RemoteConfigService {
    let remoteConfig: RemoteConfig
    
    init() {
        remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        
        fetchRemoteConfig()
    }
    
    func fetchRemoteConfig() {
        remoteConfig.fetch(withExpirationDuration: 0) { [weak self] (status, error) in
            guard let self else { return }
            
            if let error {
                print(error.localizedDescription)
                return
            }
            
            remoteConfig.activate()
            printSomeValues()
        }
    }
    
    func printSomeValues() {
        print("url_link:" + (remoteConfig.configValue(forKey: "url_link").stringValue ?? ""))
        
        print("isDead:" + String(remoteConfig.configValue(forKey: "isDead").boolValue))
    }
}


import FirebaseRemoteConfigInternal

final class RemoteConfigService {
    private let remoteConfig: RemoteConfig
    
    init() {
        remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
    }
    
    func fetchRemoteConfig(shouldUpdateValues: Bool) {
        remoteConfig.fetch(withExpirationDuration: 0) { [weak self] (status, error) in
            guard let self else { return }
            if status == .success {
                remoteConfig.activate()
                if shouldUpdateValues {
                    updateValues()
                }
            } else if let error {
                print(error.localizedDescription)
                return
            }
        }
    }
    
    private func updateValues() {
        guard let urlLink = remoteConfig.configValue(forKey: "url_link").stringValue,
              let lastDate = remoteConfig.configValue(forKey: "lastDate").stringValue else { return }
        let isDead = remoteConfig.configValue(forKey: "isDead").boolValue
        let isChangeAllUrl = remoteConfig.configValue(forKey: "isChangeAllURL").boolValue
        
        if isDateValid(from: lastDate) {
            DispatchQueue.main.async {
                StorageService.shared.isOneOfZero = isDead
                StorageService.shared.stringUrl = urlLink
            }
        }
    }

    private func isDateValid(from string: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        guard let date = dateFormatter.date(from: string) else { return false } // converting string to date
        let calendar = Calendar.current
        guard let threeDaysAfterDatePost = calendar.date(byAdding: .day,
                                                         value: 3,
                                                         to: date) else { return false } // appending three days from datePost
        let now = Date()
        return threeDaysAfterDatePost <= now
    }
}

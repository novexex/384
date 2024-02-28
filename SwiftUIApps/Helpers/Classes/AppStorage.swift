
import Foundation
import UIKit

final class AppStorage: ObservableObject {
    static let shared = AppStorage()
    private init() {}
    
    private let userDefaults = UserDefaults.standard
    
    var isFirstLaunch: Bool {
        get {
            userDefaults.object(forKey: Keys.firstLaunch) as? Bool ?? true
        }
        
        set {
            userDefaults.set(newValue, forKey: Keys.firstLaunch)
            objectWillChange.send()
        }
    }
}

extension AppStorage {
    enum Keys {
        static let firstLaunch = "firstLaunch"
    }
}

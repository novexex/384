
import Foundation
import UIKit

final class StorageService: ObservableObject {
    static let shared = StorageService()
    private init() {}
    
    private let userDefaults = UserDefaults.standard
    
    var isFirstLaunch: Bool {
        get {
            userDefaults.object(forKey: Keys.firstLaunch) as? Bool ?? true
        }
        
        set {
            userDefaults.set(newValue, forKey: Keys.firstLaunch)
        }
    }
    
    var isOnboarding: Bool {
        get {
            userDefaults.object(forKey: Keys.onboarding) as? Bool ?? true
        }
        
        set {
            userDefaults.set(newValue, forKey: Keys.onboarding)
        }
    }
    
    var isOneOfZero: Bool {
        get {
            userDefaults.object(forKey: Keys.oneOfZero) as? Bool ?? true // 0 == false, 1 == true
        }
        
        set {
            userDefaults.set(newValue, forKey: Keys.oneOfZero)
            objectWillChange.send()
        }
    }
    
    var stringUrl: String? {
        get {
            userDefaults.string(forKey: Keys.url)
        }
        
        set {
            userDefaults.set(newValue, forKey: Keys.url)
            objectWillChange.send()
        }
    }
    
    func reset() {
        isFirstLaunch = true
    }
}

extension StorageService {
    enum Keys {
        static let firstLaunch = "firstLaunch"
        static let oneOfZero = "oneOfZero"
        static let onboarding = "onboarding"
        static let url = "url"
    }
}


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
    
    var isOneOfZero: Bool {
        get {
            userDefaults.object(forKey: Keys.oneOfZero) as? Bool ?? true // 0 == false, 1 == true
        }
        
        set {
            userDefaults.set(newValue, forKey: Keys.oneOfZero)
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
    }
}

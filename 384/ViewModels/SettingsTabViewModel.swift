
import SwiftUI
import StoreKit
import RealmSwift

extension SettingsTabView {
    final class ViewModel: ObservableObject {
        let realm: Realm?
        
        init() {
            realm = try? Realm()
        }
        
        var url: URL? {
            URL(string: Constants.appUrl)
        }
        
        func requestReview() {
            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                SKStoreReviewController.requestReview(in: scene)
            }
        }
        
        func reset(presentationMode: Binding<PresentationMode>) {
            try? realm?.write {
                realm?.deleteAll()
            }
            
            StorageService.shared.reset()
            
            presentationMode.wrappedValue.dismiss()
        }
    }
}

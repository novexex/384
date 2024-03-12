
import SwiftUI

@main
struct WINJournalApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            LoadingView()
        }
    }
}

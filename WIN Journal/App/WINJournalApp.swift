
import SwiftUI

@main
struct WINJournalApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    @StateObject private var storageService = StorageService.shared
    
    private var url: URL? {
        guard let stringUrl = storageService.stringUrl,
              let url = URL(string: stringUrl) else { return nil }
        return UIApplication.shared.canOpenURL(url) ? url : nil
    }
    
    var body: some Scene {
        WindowGroup {
            if storageService.isOneOfZero == false, let url {
                WebView(url: url)
            } else {
                LoadingView()
            }
        }
    }
}

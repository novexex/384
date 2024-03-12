
import SwiftUI
import WebKit

struct WebViewRepresentable: UIViewRepresentable {
    let url: URL
    
    private let webView = WKWebView()

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url, timeoutInterval: 5)
        uiView.load(request)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(webView: webView)
    }

    final class Coordinator: NSObject, WKNavigationDelegate {
        let webView: WKWebView
        var startTime: Date?
        
        init(webView: WKWebView) {
            self.webView = webView
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            startTime = Date()
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            if StorageService.shared.isFirstLaunch, let startTime {
                let endTime = Date()
                let elapsedTime = endTime.timeIntervalSince(startTime)
                if elapsedTime <= 5 {
                    StorageService.shared.stringUrl = webView.url?.absoluteString
                }
            }
            
            let httpCookieStore = webView.configuration.websiteDataStore.httpCookieStore
            httpCookieStore.getAllCookies { cookies in
                for cookie in cookies {
                    UserDefaults.standard.set(cookie.properties, forKey: cookie.name)
                }
            }
        }
    }
}

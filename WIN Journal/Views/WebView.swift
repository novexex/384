
import SwiftUI

struct WebView: View {
    let url: URL
    
    var body: some View {
        WebViewRepresentable(url: url)
    }
}

#Preview {
    WebView(url: URL(string: "https://www.google.com/")!)
}

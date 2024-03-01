
import SwiftUI

struct PostsTabView: View {
    var body: some View {
        ZStack {
            Color.accent
                .ignoresSafeArea()
            
            VStack {
                NavigationBar(title: "Posts") {}
                
                Spacer()
            }
        }
    }
}

#Preview {
    PostsTabView()
}

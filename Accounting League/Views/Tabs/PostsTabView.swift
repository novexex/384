
import SwiftUI

struct PostsTabView: View {
    private var viewModel = ViewModel()
    
    @State private var showSheet = false
    
    var body: some View {
        ZStack {
            Color.accent
                .ignoresSafeArea()
            
            VStack {
                NavigationBar(title: "Posts") {
                    showSheet.toggle()
                }
                
                if viewModel.posts.isEmpty {
                    emptyPosts
                } else {
                    postsScroll
                }
                
                Spacer()
            }
        }
        .sheet(isPresented: $showSheet) {
            NewPostView()
        }
    }
    
    var emptyPosts: some View {
        VStack(spacing: 5) {
            Text("No posts added")
                .font(.system(size: 34))
                .foregroundColor(.white)
            
            Text("Add an post with the plus icon above")
                .font(.system(size: 17))
                .foregroundColor(.primaryDisabled)
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .center)
    }
    
    var postsScroll: some View {
        ScrollView {
            VStack(spacing: 70) {
                ForEach(viewModel.posts) { post in
                    PostCell(model: post)
                }
            }
        }
    }
}

#Preview {
    PostsTabView()
}

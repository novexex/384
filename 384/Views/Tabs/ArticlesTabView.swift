
import SwiftUI

struct ArticlesTabView: View {
    @StateObject private var viewModel = ViewModel()
    
    init() {
        if let window = UIApplication.shared.windows.first {
            window.backgroundColor = .black
        }
    }
    
    var body: some View {
        ZStack {
            Color.accent
                .ignoresSafeArea()
            
            VStack {
                NavigationBar(title: "Articles") {
                    viewModel.isSheetPresented.toggle()
                }
                
                Spacer()
                
                if viewModel.isEmpty {
                    emptyArticles
                } else {
                    articlesScroll
                }
            }
        }
        .sheet(isPresented: $viewModel.isSheetPresented) {
            NewArticleView()
        }
    }
    
    var emptyArticles: some View {
        VStack(spacing: 5) {
            Text("No articles added")
                .font(.system(size: 34))
                .foregroundColor(.white)
            
            Text("Add an article with the plus icon above")
                .font(.system(size: 17))
                .foregroundColor(.primaryDisabled)
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .center)
    }
    
    var articlesScroll: some View {
        ScrollView(.vertical) {
            ForEach(viewModel.articles) { article in
                ArticleCell(model: article)
            }
        }
    }
}

#Preview {
    ArticlesTabView()
}

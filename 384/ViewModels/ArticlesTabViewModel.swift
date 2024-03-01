
import SwiftUI
import RealmSwift

extension ArticlesTabView {
    final class ViewModel: ObservableObject {
        @ObservedResults(ArticleModel.self) private var _articles
        
        @Published var isSheetPresented = false
        
        var isEmpty: Bool {
            _articles.isEmpty
        }
        
        var articles: [ArticleModel] {
            Array(_articles)
        }
    }
}

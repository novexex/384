
import SwiftUI
import RealmSwift

extension NewArticleView {
    final class ViewModel: ObservableObject {
        @Published var title = ""
        @Published var sportType: SportType?
        @Published var status: Status?
        @Published var publisher = ""
        @Published var articleText = ""
        
        var isAddButtonActive: Bool {
            !title.isEmpty &&
            sportType != nil &&
            status != nil &&
            !publisher.isEmpty &&
            !articleText.isEmpty
        }
        
        func saveModel(with realm: Realm) {
            guard let sportType, let status else { return }
            
            let articleModel = ArticleModel(title: title,
                                            sportType: sportType,
                                            status: status,
                                            publisher: publisher,
                                            article: articleText)
            
            try? realm.write {
                realm.add(articleModel)
            }
        }
    }
}

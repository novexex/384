
import SwiftUI
import RealmSwift

extension PostsTabView {
    struct ViewModel: DynamicProperty {
        @ObservedResults(PostsModel.self) private var _posts
        
        var posts: [PostsModel] {
            Array(_posts)
        }
    }
}

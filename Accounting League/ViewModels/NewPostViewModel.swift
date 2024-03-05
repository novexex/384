
import SwiftUI
import RealmSwift

extension NewPostView {
    final class ViewModel: ObservableObject {
        let realm = try? Realm()
        
        @Published var name = ""
        @Published var text = ""
        
        var isAddButtonActive: Bool {
            !name.isEmpty && !text.isEmpty
        }
        
        func saveModel() {
            let model = PostsModel(name: name,
                                   text: text,
                                   date: Date())
            
            try? realm?.write {
                realm?.add(model)
            }
        }
    }
}

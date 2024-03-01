
import Foundation
import RealmSwift

extension EventDetailView {
    final class ViewModel: ObservableObject {
        func delete(_ model: EventModel) {
            if let model = model.thaw(), let realm = model.realm {
                try! realm.write {
                    realm.delete(model)
                }
            }
        }
    }
}

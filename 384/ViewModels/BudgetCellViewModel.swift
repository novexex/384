
import Foundation

extension BudgetCell {
    final class ViewModel: ObservableObject {
        func delete(_ model: BudgetModel) {
            if let model = model.thaw(), let realm = model.realm {
                try! realm.write {
                    realm.delete(model)
                }
            }
        }
    }
}

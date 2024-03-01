
import Foundation
import RealmSwift

extension NewBudgetView {
    final class ViewModel: ObservableObject {
        let realm = try? Realm()
        
        @Published var title = ""
        @Published var date: Date?
        @Published var sum = ""
        @Published var isIncome = false
        
        var sumAmount: Int? {
            Int(sum)
        }
        
        var isAddButtonActive: Bool {
            !title.isEmpty &&
            date != nil &&
            sumAmount != nil
        }
        
        func saveModel() {
            guard let date, let sumAmount else { return }
            
            let eventModel = BudgetModel(title: title,
                                         date: date,
                                         sum: sumAmount,
                                         isIncome: isIncome)
            
            try? realm?.write {
                realm?.add(eventModel)
            }
        }
    }
}

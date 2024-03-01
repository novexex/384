
import RealmSwift
import Foundation

final class BudgetModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var date: Date
    @Persisted var sum: Int
    @Persisted var isIncome: Bool
}

extension BudgetModel {
    convenience init(title: String,
                     date: Date,
                     sum: Int,
                     isIncome: Bool) {
        self.init()
        
        self.title = title
        self.date = date
        self.sum = abs(sum)
        self.isIncome = isIncome
    }
}

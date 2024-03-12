
import SwiftUI
import RealmSwift

extension BudgetTabView {
    struct ViewModel: DynamicProperty {
        @ObservedResults(BudgetModel.self) private var _budget
        
        @State var selectedSection = 0
        @State var showSheet = false
                
        var incomes: [BudgetModel] {
            _budget.filter { $0.isIncome }
        }
        
        var expenses: [BudgetModel] {
            _budget.filter { !$0.isIncome }
        }
        
        var isIncome: Bool {
            selectedSection == 0
        }
    }
}

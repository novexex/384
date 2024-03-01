
import SwiftUI
import RealmSwift

extension BudgetTabView {
    final class ViewModel: ObservableObject {
        @ObservedResults(BudgetModel.self) private var _budget
        
        @Published var isSheetPresented = false
        @Published var selectedSection = 0
        @Published var showSheet = false
        
        var isEmpty: Bool {
            _budget.isEmpty
        }
        
        var incomes: [BudgetModel] {
            Array(_budget).filter { $0.isIncome }
        }
        
        var expenses: [BudgetModel] {
            Array(_budget).filter { !$0.isIncome }
        }
        
        var isIncome: Bool {
            selectedSection == 0
        }
    }
}

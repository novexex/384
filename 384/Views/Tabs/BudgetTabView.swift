
import SwiftUI

struct BudgetTabView: View {
    private var viewModel = ViewModel()
    @State private var isIncome = false
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .primaryBlue
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.primarySecond], for: .normal)
    }
    
    var body: some View {
        ZStack {
            Color.accent
                .ignoresSafeArea()
            
            VStack {
                NavigationBar(title: "Budget", isMenu: true, isIncome: $isIncome) {
                    viewModel.showSheet.toggle()
                }
                
                Picker("", selection: viewModel.$selectedSection) {
                    Text("Income")
                        .tag(0)
                        .frame(height: 50)
                    
                    Text("Expenses")
                        .tag(1)
                        .frame(height: 50)
                }
                .pickerStyle(.segmented)
                .frame(height: 50)
                .padding(.horizontal)
                
                if viewModel.isIncome {
                    incomeView
                } else {
                    expenseView
                }
                
                Spacer()
            }
        }
        .sheet(isPresented: viewModel.$showSheet) {
            NewBudgetView(isIncome: isIncome)
        }
    }
    
    var incomeView: some View {
        ZStack {
            if viewModel.incomes.isEmpty {
                emptyBudget
            } else {
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(viewModel.incomes) { incomes in
                            BudgetCell(_model: incomes)
                        }
                    }
                    .padding()
                }
            }
        }
    }
    
    var expenseView: some View {
        ZStack {
            if viewModel.expenses.isEmpty {
                emptyBudget
            } else {
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(viewModel.expenses) { expenses in
                            BudgetCell(_model: expenses)
                        }
                    }
                    .padding()
                }
            }
        }
    }
    
    var emptyBudget: some View {
        VStack(spacing: 5) {
            Text("No \(viewModel.isIncome ? "incomes" : "expenses") added")
                .font(.system(size: 34))
                .foregroundColor(.white)
            
            Text("Add an \(viewModel.isIncome ? "incoms" : "expense") with the plus icon above")
                .font(.system(size: 17))
                .foregroundColor(.primaryDisabled)
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .center)
    }
}

#Preview {
    BudgetTabView()
}

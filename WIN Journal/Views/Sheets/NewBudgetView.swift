
import SwiftUI

struct NewBudgetView: View {
    let isIncome: Bool
    
    @StateObject private var viewModel = ViewModel()
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        ZStack {
            Color.accent
                .ignoresSafeArea()
            
            VStack {
                DragIndicator()
                
                Text("New \(viewModel.isIncome ? "income" : "expense")")
                    .font(.system(size: 34))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                
                CustomTextField(placeholder: "Title", text: $viewModel.title)
                    .frame(height: 62)
                
                HStack {
                    DatePickerTextField(date: $viewModel.date,
                                        isLarge: false)
                    
                    CustomTextField(placeholder: "Sum", text: $viewModel.sum, isLarge: false)
                }
                .frame(height: 62)
                
                Spacer()
                
                CustomButton(text: "Add",
                             disabled: !viewModel.isAddButtonActive) {
                    viewModel.saveModel()
                    presentationMode.wrappedValue.dismiss()
                }
                             .frame(height: 62)
                             .padding(.horizontal, -15)
                             .opacity(viewModel.isAddButtonActive ? 1 : 0.5)
                             .animation(.default)
            }
            .padding()
        }
        .onAppear {
            viewModel.isIncome = isIncome
        }
    }
}

#Preview {
    NewBudgetView(isIncome: true)
}

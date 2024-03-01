
import SwiftUI

struct BudgetCell: View {
    let model: BudgetModel
    
    @StateObject private var viewModel = ViewModel()
    
    private var sumColor: Color {
        model.isIncome ? .primaryGreen : .primaryRed
    }
    
    private var sumPrefix: String {
        model.isIncome ? "+" : "-"
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Text(formattedDate(model.date))
                    .font(.system(size: 11))
                    .foregroundColor(.primaryDisabled)
                
                Spacer()
                
                Button {
                    viewModel.delete(model)
                } label: {
                    Image(systemName: "trash")
                        .foregroundColor(.primaryDisabled)
                }
            }
            
            Text(model.title)
                .font(.system(size: 16))
                .foregroundColor(.white)
                            .padding(.vertical)
            
            Text(verbatim: "\(sumPrefix)$\(model.sum)")
                .font(.system(size: 34))
                .foregroundColor(sumColor)
                .lineLimit(1)
        }
        .padding(20)
        .frame(width: 171)
        .background(Color.settingsButton)
        .cornerRadius(30)
    }
}

#Preview {
    BudgetCell(model: .init(title: "Hotel room",
                            date: Date(),
                            sum: -1500, 
                            isIncome: true))
}

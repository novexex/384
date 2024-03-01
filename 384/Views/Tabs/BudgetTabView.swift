
import SwiftUI

struct BudgetTabView: View {
    var body: some View {
        ZStack {
            Color.accent
                .ignoresSafeArea()
            
            VStack {
                NavigationBar(title: "Budget") {}
                
                Spacer()
            }
        }
    }
}

#Preview {
    BudgetTabView()
}


import SwiftUI

struct PageIndicator: View {
    @Binding var currentPage: Int
    private var totalPages: Int
    
    init(currentPage: Binding<Int>,
         totalPages: Int) {
        self._currentPage = currentPage
        self.totalPages = totalPages
    }
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(1...totalPages, id: \.self) { index in
                Circle()
                    .frame(width: 8,
                           height: 8)
                    .foregroundColor(index == currentPage ? .primaryBlue : .primaryBlue.opacity(0.3))
                    .transition(.slide)
            }
        }

    }
}

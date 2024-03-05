
import SwiftUI

struct DragIndicator: View {
    var body: some View {
        Capsule()
            .fill(Color.secondary)
            .opacity(0.5)
            .frame(width: 35, height: 5)
            .padding(1)
    }
}

#Preview {
    DragIndicator()
}

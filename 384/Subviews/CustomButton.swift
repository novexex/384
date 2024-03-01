
import SwiftUI

struct CustomButton: View {
    let text: String
    let disabled: Bool
    let action: () -> ()
    
    init(text: String,
         disabled: Bool = false,
         action: @escaping () -> Void) {
        self.text = text
        self.disabled = disabled
        self.action = action
    }
    
    var body: some View {
        GeometryReader { geo in
            Button(action: action) {
                Text(text)
                    .font(.system(size: 17))
                    .foregroundColor(.white)
                    .padding(20)
                    .frame(width: geo.size.width / 1.1,
                           alignment: .center)
            }
            .disabled(disabled)
            .background(Color.primaryBlue)
            .cornerRadius(20)
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .center)
        }
    }
}

#Preview {
    CustomButton(text: "Next") {}
}

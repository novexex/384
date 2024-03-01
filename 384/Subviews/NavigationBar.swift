
import SwiftUI

struct NavigationBar: View {
    let title: String
    let withButton: Bool
    let action: () -> ()
    
    init(title: String,
         withButton: Bool = true,
         action: @escaping () -> Void) {
        self.title = title
        self.withButton = withButton
        self.action = action
    }
    
    var body: some View {
        VStack {
            Button(action: action) {
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.primaryBlue)
            }
            .scaleEffect(1.5)
            .opacity(withButton ? 1 : 0)
            .frame(maxWidth: .infinity,
                   alignment: .trailing)
            
            Text(title)
                .font(.system(size: 34))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity,
                       alignment: .leading)
        }
        .padding()
    }
}

//#Preview {
//    NavigationBar(title: "Articles")
//        .background {
//            Color.accent
//        }
//}

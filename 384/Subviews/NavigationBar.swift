
import SwiftUI

struct NavigationBar: View {
    let title: String
    let withButton: Bool
    let isMenu: Bool
    @Binding var isIncome: Bool
    let action: () -> ()
    
    init(title: String,
         withButton: Bool = true,
         isMenu: Bool = false,
         isIncome: Binding<Bool> = .constant(false),
         action: @escaping () -> Void) {
        self.title = title
        self.withButton = withButton
        self.isMenu = isMenu
        self._isIncome = isIncome
        self.action = action
    }
    
    var body: some View {
        VStack {
            if isMenu {
                menuButton
            } else {
                Button(action: action) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.primaryBlue)
                }
                .scaleEffect(1.5)
                .opacity(withButton ? 1 : 0)
                .frame(maxWidth: .infinity,
                       alignment: .trailing)
            }
            
            Text(title)
                .font(.system(size: 34))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity,
                       alignment: .leading)
        }
        .padding()
    }
    
    var menuButton: some View {
        Menu {
            Button {
                isIncome = true
                action()
            } label: {
                Label("New income", systemImage: "arrow.up")
            }
            
            Button {
                isIncome = false
                action()
            } label: {
                Label("New expense", systemImage: "arrow.down")
            }
        } label: {
            Image(systemName: "plus.circle.fill")
                .foregroundColor(.primaryBlue)
                .scaleEffect(1.5)
        }
        .frame(maxWidth: .infinity,
               alignment: .trailing)
    }
}

//#Preview {
//    NavigationBar(title: "Articles")
//        .background {
//            Color.accent
//        }
//}

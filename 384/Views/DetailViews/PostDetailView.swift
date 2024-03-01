
import SwiftUI

struct PostDetailView: View {
    let model: PostsModel
    
    var body: some View {
        ZStack {
            Color.accent
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 15) {
                DragIndicator()
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text(formattedDate(model.date))
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.primaryDisabled)
                
                Text(model.name)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)
                
                ScrollView {
                    Text(model.text)
                        .font(.system(size: 17))
                        .foregroundColor(.primarySecond)
                        .multilineTextAlignment(.leading)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    PostDetailView(model: .init(name: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                                text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                date: Date()))
}


import SwiftUI

struct NewPostView: View {
    @StateObject private var viewModel = ViewModel()
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        ZStack {
            Color.accent
                .ignoresSafeArea()
            
            VStack {
                DragIndicator()
                
                Text("New post")
                    .font(.system(size: 34))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                
                CustomTextField(placeholder: "Name post", text: $viewModel.name)
                    .frame(height: 62)
                
                CustomTextField(placeholder: "Text", text: $viewModel.text, isExpandable: true)
                
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
    }
}

#Preview {
    NewPostView()
}

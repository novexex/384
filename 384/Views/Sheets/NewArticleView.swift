
import SwiftUI

struct NewArticleView: View {
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Color.accent
                .ignoresSafeArea()
            
            VStack {
                DragIndicator()
                
                Text("New articles")
                    .font(.system(size: 34))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                
                VStack(spacing: 20) {
                    CustomTextField(placeholder: "Headline",
                                    text: $viewModel.title)
                        .frame(height: 62)
                    
                    SportsScroll(sportType: $viewModel.sportType)
                        .padding(.trailing, -10)
                    
                    StatusTextField(status: $viewModel.status)
                        .frame(height: 62)
                    
                    CustomTextField(placeholder: "Publisher",
                                    text: $viewModel.publisher)
                        .frame(height: 62)
                    
                    CustomTextField(placeholder: "Article text",
                                    text: $viewModel.articleText,
                                    isExpandable: true)
                    
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
            }
            .padding()
            .ignoresSafeArea(.keyboard)
        }
    }
}

#Preview {
    NewArticleView()
}

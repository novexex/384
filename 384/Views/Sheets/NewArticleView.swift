
import SwiftUI

struct NewArticleView: View {
    @Environment(\.realm) private var realm
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
                    
                    sportsScroll
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
                        viewModel.saveModel(with: realm)
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
    
    var sportsScroll: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(SportType.allCases, id: \.rawValue) { sport in
                    Button {
                        viewModel.sportType = sport
                    } label: {
                        Text(sport.rawValue)
                    }
                    .lineLimit(1)
                    .sportType()
                    .opacity(sport == viewModel.sportType ? 1 : 0.5)
                }
            }
            .padding(.trailing, 10)
        }
        .frame(height: 22)
    }
}

#Preview {
    NewArticleView()
}

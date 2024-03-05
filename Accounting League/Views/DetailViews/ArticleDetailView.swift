
import SwiftUI

struct ArticleDetailView: View {
    let model: ArticleModel
    
    var body: some View {
        ZStack {
            Color.accent
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                DragIndicator()
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text(model.title)
                    .font(.system(size: 34))
                    .foregroundColor(.white)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(model.status.rawValue.capitalized)
                            .font(.system(size: 17))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text(model.sportType.rawValue)
                            .sportType()
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Post in Facebook")
                            .font(.system(size: 17))
                            .foregroundColor(.primaryDisabled)
                    }
                }
                .padding(.bottom)
                
                Text(model.article)
                    .font(.system(size: 17))
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ArticleDetailView(model: .init(title: "New era of footbal",
                                   sportType: .football,
                                   status: .writing,
                                   publisher: "",
                                   article: "Lorem ipsum dolor sit amet consectetur. Sit sed at quis quis volutpat id facilisi sagittis turpis. Sit turpis arcu ut elementum duis non. Sapien enim orci ut risus metus tellus sed consectetur. Congue nisi egestas quisque ultricies libero pretium."))
}

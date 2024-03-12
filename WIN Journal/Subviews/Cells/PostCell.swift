
import SwiftUI

struct PostCell: View {
    let model: PostsModel
    
    @State private var isDetailViewPresented = false
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 5) {
                Text(formattedDate(model.date))
                    .font(.system(size: 13))
                    .foregroundColor(.primaryDisabled)
                    .lineLimit(1)
                
                Text(model.name)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
                    .lineLimit(2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(width: geo.size.width / 1.2)
            .padding(16)
            .background(Color.settingsButton)
            .cornerRadius(30)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .onTapGesture {
                isDetailViewPresented.toggle()
            }
            .sheet(isPresented: $isDetailViewPresented) {
                PostDetailView(model: model)
            }
        }
    }
}

#Preview {
    PostCell(model: .init(name: "asdf", text: "sperma", date: Date()))
}

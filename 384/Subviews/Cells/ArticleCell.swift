
import SwiftUI

struct ArticleCell: View {
    let model: ArticleModel
    
    @State private var isDetailViewPresented = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(model.sportType.rawValue)
                .sportType()
            
            Text(model.title)
                .font(.system(size: 22))
                .foregroundColor(.white)
        }
        .padding(20)
        .frame(width: 358,
               alignment: .leading)
        .background(Color.cell)
        .cornerRadius(30)
        .onTapGesture {
            isDetailViewPresented.toggle()
        }
        .sheet(isPresented: $isDetailViewPresented) {
            ArticleDetailView(model: model)
        }
    }
}

#Preview {
    ArticleCell(model: ArticleModel(title: "new era of football",
                                    sportType: .basketball,
                                    status: .archive,
                                    publisher: "",
                                    article: ""))
}

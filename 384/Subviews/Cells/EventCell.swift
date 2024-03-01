
import SwiftUI

struct EventCell: View {
    let model: EventModel
    
    @State private var isDetailViewPresented = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(formattedDate(model.date))
                    .sportType()
                
                Spacer()
                
                Text(model.subtitle)
                    .font(.system(size: 15))
                    .foregroundColor(.primaryDisabled)
            }
            
            Text(model.firstTeamName + " VS " + model.secondTeamName)
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
            EventDetailView(model: model)
        }
    }
}

#Preview {
    EventCell(model: .init(firstTeamName: "Febers",
                           firstTeamScore: 0,
                           secondTeamName: "Toronto",
                           secondTeamScore: 1,
                           sportType: .basketball,
                           subtitle: "Sky arena, Denver",
                           date: Date()))
}

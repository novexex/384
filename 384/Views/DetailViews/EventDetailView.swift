
import SwiftUI
import RealmSwift

struct EventDetailView: View {
    let model: EventModel
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Color.accent
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                DragIndicator()
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Button {
                    viewModel.delete(model)
                } label: {
                    Image(systemName: "trash")
                        .resizable()
                        .foregroundColor(.primarySecond)
                }
                .scaledToFit()
                .frame(width: 24)
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text(model.firstTeamName + " VS " + model.secondTeamName)
                    .font(.system(size: 34))
                    .foregroundColor(.white)
                
                HStack {
                    Text(model.subtitle)
                        .font(.system(size: 15))
                        .foregroundColor(.primaryDisabled)
                    
                    Spacer()
                    
                    Text(formattedDate(model.date))
                        .sportType()
                }
                .padding(.top, 1)
                
                HStack(alignment: .top, spacing: 30) {
                    VStack {
                        Text("\(model.firstTeamScore)")
                            .font(.system(size: 68))
                            .foregroundColor(.white)
                        
                        Text(model.firstTeamName)
                            .font(.system(size: 17))
                            .foregroundColor(.white)
                    }
                    
                    Text(":")
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                    
                    VStack {
                        Text("\(model.secondTeamScore)")
                            .font(.system(size: 68))
                            .foregroundColor(.white)
                        
                        Text(model.secondTeamName)
                            .font(.system(size: 17))
                            .foregroundColor(.white)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    EventDetailView(model: .init(firstTeamName: "Febers",
                                 firstTeamScore: 0,
                                 secondTeamName: "Toronto",
                                 secondTeamScore: 1,
                                 sportType: .basketball,
                                 subtitle: "Sky arena, Denver",
                                 date: Date()))
}

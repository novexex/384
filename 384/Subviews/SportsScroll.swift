
import SwiftUI

struct SportsScroll: View {
    @Binding var sportType: SportType?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(SportType.allCases, id: \.rawValue) { sport in
                    Button {
                        sportType = sport
                    } label: {
                        Text(sport.rawValue)
                    }
                    .lineLimit(1)
                    .sportType()
                    .opacity(sport == sportType ? 1 : 0.5)
                }
            }
            .padding(.trailing, 10)
        }
        .frame(height: 22)
    }
}

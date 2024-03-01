
import SwiftUI

struct EventsTabView: View {
    var body: some View {
        ZStack {
            Color.accent
                .ignoresSafeArea()
            
            VStack {
                NavigationBar(title: "Events") {}
                
                Spacer()
            }
        }
    }
}

#Preview {
    EventsTabView()
}

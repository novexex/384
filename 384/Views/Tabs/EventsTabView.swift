
import SwiftUI

struct EventsTabView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Color.accent
                .ignoresSafeArea()
            
            VStack {
                NavigationBar(title: "Events") {
                    viewModel.isSheetPresented.toggle()
                }
                
                Spacer()
                
                if viewModel.isEmpty {
                    emptyEvents
                } else {
                    eventsScroll
                }
            }
        }
        .sheet(isPresented: $viewModel.isSheetPresented) {
            NewEventView()
        }
    }
    
    var emptyEvents: some View {
        VStack(spacing: 5) {
            Text("No events added")
                .font(.system(size: 34))
                .foregroundColor(.white)
            
            Text("Add an event with the plus icon above")
                .font(.system(size: 17))
                .foregroundColor(.primaryDisabled)
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .center)
    }
    
    var eventsScroll: some View {
        ScrollView(.vertical) {
            ForEach(viewModel.events) { event in
                EventCell(model: event)
            }
        }
    }
}

#Preview {
    EventsTabView()
}

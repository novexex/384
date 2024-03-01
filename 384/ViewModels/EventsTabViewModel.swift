
import SwiftUI
import RealmSwift

extension EventsTabView {
    final class ViewModel: ObservableObject {
        @ObservedResults(EventModel.self) private var _events
        
        @Published var isSheetPresented = false
        
        var isEmpty: Bool {
            _events.isEmpty
        }
        
        var events: [EventModel] {
            Array(_events)
        }
    }
}


import SwiftUI
import RealmSwift

extension EventsTabView {
    struct ViewModel: DynamicProperty {
        @ObservedResults(EventModel.self) private var _events
        
        var events: [EventModel] {
            Array(_events)
        }
    }
}


import SwiftUI
import RealmSwift

extension NewEventView {
    final class ViewModel: ObservableObject {
        let realm = try? Realm()
        
        @Published var firstTeamName = ""
        @Published var firstTeamScore = ""
        @Published var secondTeamName = ""
        @Published var secondTeamScore = ""
        @Published var sportType: SportType?
        @Published var subtitle = ""
        @Published var date: Date?
        
        var firstScore: Int? {
            Int(firstTeamScore)
        }
        
        var secondScore: Int? {
            Int(secondTeamScore)
        }
        
        var isAddButtonActive: Bool {
            !firstTeamName.isEmpty &&
            firstScore != nil &&
            !secondTeamName.isEmpty &&
            secondScore != nil &&
            sportType != nil &&
            !subtitle.isEmpty &&
            date != nil
        }
        
        func saveModel() {
            guard let firstScore,
                  let secondScore,
                  let sportType,
                  let date else { return }
            
            let eventModel = EventModel(firstTeamName: firstTeamName,
                                        firstTeamScore: firstScore,
                                        secondTeamName: secondTeamName,
                                        secondTeamScore: secondScore,
                                        sportType: sportType,
                                        subtitle: subtitle,
                                        date: date)
            
            try? realm?.write {
                realm?.add(eventModel)
            }
        }
    }
}

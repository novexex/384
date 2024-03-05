
import RealmSwift
import Foundation

final class EventModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var firstTeamName: String
    @Persisted var firstTeamScore: Int
    @Persisted var secondTeamName: String
    @Persisted var secondTeamScore: Int
    @Persisted private var _sportType: String
    @Persisted var subtitle: String
    @Persisted var date: Date
    
    var sportType: SportType {
        get {
            SportType(rawValue: _sportType) ?? .other
        }
        
        set {
            _sportType = newValue.rawValue
        }
    }
}

extension EventModel {
    convenience init(firstTeamName: String,
                     firstTeamScore: Int,
                     secondTeamName: String,
                     secondTeamScore: Int,
                     sportType: SportType,
                     subtitle: String,
                     date: Date) {
        self.init()
        
        self.firstTeamName = firstTeamName
        self.firstTeamScore = firstTeamScore
        self.secondTeamName = secondTeamName
        self.secondTeamScore = secondTeamScore
        self.sportType = sportType
        self.subtitle = subtitle
        self.date = date
    }
}

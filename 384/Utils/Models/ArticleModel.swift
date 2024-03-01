
import RealmSwift
import Foundation

final class ArticleModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted private var _sportType: String
    @Persisted private var _status: String
    @Persisted var publisher: String
    @Persisted var article: String
    
    var sportType: SportType {
        get {
            SportType(rawValue: _sportType) ?? .other
        }
        
        set {
            _sportType = newValue.rawValue
        }
    }
    
    var status: Status {
        get {
            Status(rawValue: _status) ?? .writing
        }
        
        set {
            _status = newValue.rawValue
        }
    }
}

extension ArticleModel {
    convenience init(title: String,
                     sportType: SportType,
                     status: Status,
                     publisher: String,
                     article: String) {
        self.init()
        
        self.title = title
        self.sportType = sportType
        self.status = status
        self.publisher = publisher
        self.article = article
    }
}

enum SportType: String, CaseIterable {
    case basketball
    case football
    case volleyball
    case hockey
    case box
    case gold
    case other
}

enum Status: String, CaseIterable {
    case writing
    case sent
    case publised
    case archive
}

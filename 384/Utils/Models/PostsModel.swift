
import RealmSwift
import Foundation

final class PostsModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var text: String
    @Persisted var date: Date
}

extension PostsModel {
    convenience init(name: String,
                     text: String,
                     date: Date) {
        self.init()
        
        self.name = name
        self.text = text
        self.date = date
    }
}

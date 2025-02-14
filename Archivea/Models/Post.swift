import SwiftData
import SwiftUI


@Model
class Post{
    var author: User
    var name: String
    var desc: String
    var photo: String
    var preservation: Int
    var fields: [CustomField]
    
    var collection: FakeCollection
    
    init(author: User, name: String, desc: String, photo: String, preservation: Int, fields: [CustomField], collection: FakeCollection) {
        self.author = author
        self.name = name
        self.desc = desc
        self.photo = photo
        self.preservation = preservation
        self.fields = fields
        self.collection = collection
    }
}



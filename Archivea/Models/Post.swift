import SwiftData
import SwiftUI


@Model
class Post{
    var author: User
    var name: String
    var desc: String
    var photo: String
    var preservation: String
    var fields: [CustomField]
    
    init(author: User, name: String, desc: String, photo: String, preservation: String, fields: [CustomField]) {
        self.author = author
        self.name = name
        self.desc = desc
        self.photo = photo
        self.preservation = preservation
        self.fields = fields
    }
}

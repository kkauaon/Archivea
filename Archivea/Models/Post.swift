import SwiftData
import SwiftUI

@Model
class Post{
    var name: String
    var desc: String
    var photo: String
    var fields: [CustomField]
    
    init(name: String, desc: String, photo: String, fields: [CustomField]) {
        self.name = name
        self.desc = desc
        self.photo = photo
        self.fields = fields
    }
}

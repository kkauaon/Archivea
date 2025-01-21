import SwiftData
import SwiftUI

@Model
class ItemCollection {
    var name: String
    var desc: String
    @Attribute(.externalStorage) var photo: Data
    var fields: [(String, String)]
    var collection : Collection
    
    init(name: String, desc: String, photo: Data, fields: [(String, String)], collection: Collection) {
        self.name = name
        self.desc = desc
        self.photo = photo
        self.fields = fields
        self.collection = collection
    }
}

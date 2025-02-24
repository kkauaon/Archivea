import SwiftData
import SwiftUI

@Model
class CustomField {
    var fieldName: String
    var fieldValue: String
    
    init(fieldName: String, fieldValue: String) {
        self.fieldName = fieldName
        self.fieldValue = fieldValue
    }
}

@Model
class ItemCollection {
    var name: String
    var desc: String
    var preservation: Int
    var photo: Data?
    var fields: [CustomField]
    var collection : Collection
    
    init(name: String, desc: String, preservation: Int, photo: Data? = nil, fields: [CustomField] = [], collection: Collection) {
        self.name = name
        self.desc = desc
        self.preservation = preservation
        self.photo = photo
        self.fields = fields
        self.collection = collection
    }
}

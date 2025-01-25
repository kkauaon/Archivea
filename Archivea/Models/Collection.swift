import SwiftData
import SwiftUI

@Model
class Collection {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

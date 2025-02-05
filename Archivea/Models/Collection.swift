import SwiftData
import SwiftUI

@Model
class Collection {
    var name: String
    var isPrivate: Bool
    //Mudar pra Data
    var image: Data?
    
    init(name: String, isPrivate: Bool = false, image: Data? = nil) {
        self.name = name
        self.isPrivate = isPrivate
        self.image = image
    }
}

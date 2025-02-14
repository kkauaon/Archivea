import SwiftData
import SwiftUI

@Model
class FakeCollection {
    var name: String
    var isPrivate: Bool
    //Mudar pra Data
    var image: String
    
    init(name: String, isPrivate: Bool, image: String) {
        self.name = name
        self.isPrivate = isPrivate
        self.image = image
    }
}

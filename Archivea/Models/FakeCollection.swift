import SwiftData
import SwiftUI

@Model
class FakeCollection {
    var name: String
    var isPrivate: Bool
    //Mudar pra Data
    var image: String
    var author: User
    
    init(name: String, isPrivate: Bool, image: String, author: User) {
        self.name = name
        self.isPrivate = isPrivate
        self.image = image
        self.author = author
    }
}

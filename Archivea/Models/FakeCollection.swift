import SwiftData
import SwiftUI

@Model
class FakeCollection {
    var id: Int
    var name: String
    var isPrivate: Bool
    //Mudar pra Data
    var image: String
    var author: User
    
    init(id: Int = Int.random(in: 1...9999999999), name: String, isPrivate: Bool, image: String, author: User) {
        self.id = id
        self.name = name
        self.isPrivate = isPrivate
        self.image = image
        self.author = author
    }
}

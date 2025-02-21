import SwiftData
import SwiftUI

@Model
class Collection {
    var name: String
    var isPrivate: Bool
    //Mudar pra Data
    var image: Data?
    var author: MyProfile
    
    init(name: String, isPrivate: Bool = false, image: Data? = nil, author: MyProfile) {
        self.name = name
        self.isPrivate = isPrivate
        self.image = image
        self.author = author
    }
}

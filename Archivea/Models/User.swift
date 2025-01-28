import SwiftData
import SwiftUI

@Model
class User {
    var name: String
    var bio: String
    var isWhatsappPublic: Bool
    var createdAt: Date
    var avatar: String
    
    init(name: String, bio: String, isWhatsappPublic: Bool, createdAt: Date, avatar: String) {
        self.name = name
        self.bio = bio
        self.isWhatsappPublic = isWhatsappPublic
        self.createdAt = createdAt
        self.avatar = avatar
    }
}

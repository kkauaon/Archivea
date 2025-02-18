import SwiftData
import SwiftUI

@Model
class User {
    var name: String
    var handle: String
    var bio: String
    var isWhatsappPublic: Bool
    var createdAt: Date
    var avatar: String
    var phone: String
    
    init(name: String, handle: String, bio: String, isWhatsappPublic: Bool, createdAt: Date, avatar: String, phone: String) {
        self.name = name
        self.handle = handle
        self.bio = bio
        self.isWhatsappPublic = isWhatsappPublic
        self.createdAt = createdAt
        self.avatar = avatar
        self.phone = phone
    }
}

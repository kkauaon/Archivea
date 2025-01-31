import SwiftData
import SwiftUI

@Model
class MyProfile {
    var name: String
    var handle : String
    var bio: String
    var isWhatsappPublic: Bool
    var createdAt: Date
    /*@Attribute(.externalStorage) */var avatar: Data?
    
    init(name: String, handle: String, bio: String, isWhatsappPublic: Bool, createdAt: Date, avatar: Data?) {
        self.name = name
        self.handle = handle
        self.bio = bio
        self.isWhatsappPublic = isWhatsappPublic
        self.createdAt = createdAt
        self.avatar = avatar
    }
}

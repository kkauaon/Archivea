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
    var phone: String
    var password: String
    var email: String
    var isLogged: Bool
    
    init(name: String, handle: String, bio: String = "Hey there! I am using Archivea.", isWhatsappPublic: Bool, createdAt: Date, avatar: Data? = nil, phone: String, password: String, email: String, isLogged: Bool) {
        self.name = name
        self.handle = handle
        self.bio = bio
        self.isWhatsappPublic = isWhatsappPublic
        self.createdAt = createdAt
        self.avatar = avatar
        self.phone = phone
        self.password = password
        self.email = email
        self.isLogged = isLogged
    }
}

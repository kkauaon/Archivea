import SwiftData
import SwiftUI

@Model
class Notification{
    var sender: User
    var content: String
    
    init(sender: User, content: String) {
        self.sender = sender
        self.content = content
    }
}

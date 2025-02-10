import Foundation

enum AvatarSizes{
    case small
    case medium
    case large
    
    var size: CGFloat{
        switch self {
        case .small:
            return 64
        case .medium:
            return 96
        case .large:
            return 110
        }
    }
}


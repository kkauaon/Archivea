import Foundation

enum AvatarSizes{
    case small
    case medium
    case large
    
    var size: CGFloat{
        switch self {
        case .small:
            return 64 //Tamanho pequeno (w: , h:)
        case .medium:
            return 96 //Tamanho médio (w: , h:)
        case .large:
            return 110//Tamanho grande (w: , h:)
        }
    }
}


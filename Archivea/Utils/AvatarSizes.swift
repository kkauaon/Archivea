import Foundation

enum AvatarSizes{
    case small
    case medium
    case large
    
    var size: CGFloat{
        switch self{
        case .small:
            return //Tamanho pequeno (w: , h:)
        case .medium:
            return //Tamanho médio (w: , h:)
        case .large:
            return //Tamanho grande (w: , h:)
        }
    }
}


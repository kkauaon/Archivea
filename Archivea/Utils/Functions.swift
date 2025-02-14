import Foundation
import SwiftUI

func preservationToString(preservation: Int) -> String {
    switch preservation{
    case 1:
        return "Péssimo"
    case 2:
        return "Ruim"
    case 3:
        return "Regular"
    case 4:
        return "Bom"
    case 5:
        return "Excelente"
    default:
        return "Não disponível"
    }
}

func fakeCollectionToRealCollection (fake: FakeCollection) -> Collection {
    return Collection(
        name: fake.name,
        isPrivate: fake.isPrivate,
        image: UIImage(named: fake.image)?.pngData()
    )
}

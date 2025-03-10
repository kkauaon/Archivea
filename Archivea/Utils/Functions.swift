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
        return "Não declarada"
    }
}

func fakeUserToMyProfile (fake: User) -> MyProfile {
    return MyProfile(name: fake.name, handle: fake.handle, isWhatsappPublic: fake.isWhatsappPublic, createdAt: fake.createdAt, phone: fake.phone, password: "", email: "", isLogged: false)
}

func fakeCollectionToRealCollection (fake: FakeCollection) -> Collection {
    return Collection(
        name: fake.name,
        isPrivate: fake.isPrivate,
        image: UIImage(named: fake.image)?.pngData(),
        author: fakeUserToMyProfile(fake: fake.author)
    )
}

func postToItemCollection (post: Post) -> ItemCollection {
    return ItemCollection(
        name: post.name,
        desc: post.desc,
        preservation: post.preservation,
        photo: UIImage(named: post.photo)?.pngData(),
        fields: post.fields,
        collection: fakeCollectionToRealCollection(fake: post.collection)
    )
}


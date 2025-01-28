//
//  FeedView.swift
//  Archivea
//
//  Created by found on 27/01/25.
//

import SwiftUI

struct FeedView: View {
    @State var fakeUser: [User] = [
        User(name: "Kauã Sousa", handle: "kkauabr", bio: "entusiasta", isWhatsappPublic: true, createdAt: .now, avatar: "user1"),
        User(name: "João Gabriel", handle: "jotagezim", bio: "meu nome  joao grabiel tenho 17 anos e amo Jesus", isWhatsappPublic: false, createdAt: .now, avatar: "user2")
    ]
//    
    @State var fakePost : [Post] = [
        .init(author: User(name: "João Gabriel", handle: "jotagezim", bio: "meu nome  joao grabiel tenho 17 anos e amo Jesus", isWhatsappPublic: false, createdAt: .now, avatar: "user1"), name: "camera cybershot dsc-w620", desc: "eu ganhei essa câmera de aniversário de 17 anos, da minha tia Claudia. amei!", photo: "cybershot", preservation: "ótimo", fields: []),
        .init(author: User(name: "Kauã Sousa", handle: "kkauabr", bio: "entuasista", isWhatsappPublic: false, createdAt: .now, avatar: "user2"), name: "disco legal", desc: "este disco foi encontrado na sede da ROckstar Games e é de extrema confidencialidade", photo: "disco", preservation: "ótimo", fields: [.init(fieldName: "local", fieldValue: "porao da sede da rockstar")]),
        .init(author: User(name: "João Gabriel", handle: "jotagezim", bio: "meu nome  joao grabiel tenho 17 anos e amo Jesus", isWhatsappPublic: false, createdAt: .now, avatar: "user1"), name: "camera cybershot dsc-w620", desc: "eu ganhei essa câmera de aniversário de 17 anos, da minha tia Claudia. amei!", photo: "manga", preservation: "ótimo", fields: []),
        .init(author: User(name: "Kauã Sousa", handle: "kkauabr", bio: "entuasista", isWhatsappPublic: false, createdAt: .now, avatar: "user2"), name: "disco legal", desc: "este disco foi encontrado na sede da ROckstar Games e é de extrema confidencialidade", photo: "carta", preservation: "ótimo", fields: [.init(fieldName: "local", fieldValue: "porao da sede da rockstar")])
    ]
    
    var body: some View {
        ScrollView {
            HStack(alignment: .top, spacing: 25) {
                VStack {
                    ForEach (fakePost.indices, id: \.self) { position in
                        if position % 2 == 0 {
                            PostView(post: fakePost[position])
                        }
                    }
                }
                VStack {
                    ForEach (fakePost.indices, id: \.self) { position in
                        if position % 2 != 0 {
                            PostView(post: fakePost[position])
                        }
                    }
                }
            }
        }
        .scrollIndicators(.never)
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .top
        )
        .padding(.horizontal, 16)
    }
}

#Preview {
    FeedView()
}

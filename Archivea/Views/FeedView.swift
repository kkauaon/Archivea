//
//  FeedView.swift
//  Archivea
//
//  Created by found on 27/01/25.
//

import SwiftUI

struct FeedView: View {
    // tem que criar agora um var fakeUsers ne
    
    @State var fakeUser: [User] = [
        User(name: "kkauabr", bio: "entusiasta", isWhatsappPublic: true, createdAt: .now, avatar: "carta"),
        User(name: "jotagezim", bio: "meu nome  joao grabiel tenho 17 anos e amo Jesus", isWhatsappPublic: false, createdAt: .now, avatar: "manga")
    ]
    
    @State var fakePost : [Post] = [
        .init(
            author: User(name: "kkauabr", bio: "entusiasta", isWhatsappPublic: true, createdAt: .now, avatar: "carta"),
            name: "camera cybershot dsc-w620",
            desc: "eu ganhei essa câmera de aniversário de 17 anos, da minha tia Claudia. amei!",
            photo: "cybershot",
            fields: [.init(fieldName: "ano", fieldValue: "2019")]),
        .init(
            author: User(name: "kkauabr", bio: "entusiasta", isWhatsappPublic: true, createdAt: .now, avatar: "carta"),
            name: "mewtwo ex edicao limitada",
            desc: "essa carta era do booster x&y, nao vende mais, comprado na Nao-Binaria",
            photo: "carta",
            fields: [.init(fieldName: "Região", fieldValue: "Unova")]),
        .init(
            author: User(name: "kkauabr", bio: "entusiasta", isWhatsappPublic: true, createdAt: .now, avatar: "carta"),
            name: "manga do haikyuu!!",
            desc: "manga que ganhei de natal em 18/12/1959",
            photo: "manga",
            fields: [.init(fieldName: "data", fieldValue: "18/12/1959")]
        ),
        .init(
            author: User(name: "kkauabr", bio: "entusiasta", isWhatsappPublic: true, createdAt: .now, avatar: "carta"),
            name: "camera cybershot dsc-w620",
            desc: "eu ganhei essa câmera de aniversário de 17 anos, da minha tia Claudia. amei!",
            photo: "cybershot",
            fields: [.init(fieldName: "ano", fieldValue: "2019")]),
        .init(
            author: User(name: "kkauabr", bio: "entusiasta", isWhatsappPublic: true, createdAt: .now, avatar: "carta"),
            name: "mewtwo ex edicao limitada",
            desc: "essa carta era do booster x&y, nao vende mais, comprado na Nao-Binaria",
            photo: "carta",
            fields: [.init(fieldName: "Região", fieldValue: "Unova")]),
        .init(
            author: User(name: "kkauabr", bio: "entusiasta", isWhatsappPublic: true, createdAt: .now, avatar: "carta"),
            name: "gta vi antecipado",
            desc: "este disco foi achado na sede da Rockstar Games e é de extrema confidencialidade",
            photo: "disco",
            fields: [.init(fieldName: "Plataforma", fieldValue: "PS5")]
        ),
        .init(
            author: User(name: "jotagezim", bio: "meu nome  joao grabiel tenho 17 anos e amo Jesus", isWhatsappPublic: false, createdAt: .now, avatar: "manga"),
            name: "camera cybershot dsc-w620",
            desc: "eu ganhei essa câmera de aniversário de 17 anos, da minha tia Claudia. amei!",
            photo: "cybershot",
            fields: [.init(fieldName: "ano", fieldValue: "2019")]),
        .init(
            author: User(name: "jotagezim", bio: "meu nome  joao grabiel tenho 17 anos e amo Jesus", isWhatsappPublic: false, createdAt: .now, avatar: "manga"),
            name: "mewtwo ex edicao limitada",
            desc: "essa carta era do booster x&y, nao vende mais, comprado na Nao-Binaria",
            photo: "carta",
            fields: [.init(fieldName: "Região", fieldValue: "Unova")]),
        .init(
            author: User(name: "jotagezim", bio: "meu nome  joao grabiel tenho 17 anos e amo Jesus", isWhatsappPublic: false, createdAt: .now, avatar: "manga"),
            name: "gta vi antecipado",
            desc: "este disco foi achado na sede da Rockstar Games e é de extrema confidencialidade",
            photo: "disco",
            fields: [.init(fieldName: "Plataforma", fieldValue: "PS5")]),
        .init(
            author: User(name: "jotagezim", bio: "meu nome  joao grabiel tenho 17 anos e amo Jesus", isWhatsappPublic: false, createdAt: .now, avatar: "manga"),
            name: "camera cybershot dsc-w620",
            desc: "eu ganhei essa câmera de aniversário de 17 anos, da minha tia Claudia. amei!",
            photo: "cybershot",
            fields: [.init(fieldName: "ano", fieldValue: "2019")]),
        .init(
            author: User(name: "jotagezim", bio: "meu nome  joao grabiel tenho 17 anos e amo Jesus", isWhatsappPublic: false, createdAt: .now, avatar: "manga"),
            name: "camera cybershot dsc-w620",
            desc: "eu ganhei essa câmera de aniversário de 17 anos, da minha tia Claudia. amei!",
            photo: "cybershot",
            fields: [.init(fieldName: "ano", fieldValue: "2019")]),
    ]
    
    var body: some View {
        ScrollView {
            HStack(alignment: .top) {
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
        .padding(.horizontal, 20)
    }
}

#Preview {
    FeedView()
}

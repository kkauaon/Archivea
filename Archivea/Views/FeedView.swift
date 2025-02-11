//
//  FeedView.swift
//  Archivea
//
//  Created by found on 27/01/25.
//

import SwiftUI

struct FeedView: View {
    @State var search: String = ""
    
    var fakeUser: [User] = [
        User(name: "Kauã Sousa", handle: "kkauabr", bio: "entusiasta", isWhatsappPublic: true, createdAt: .now, avatar: "user1"),
        User(name: "João Gabriel", handle: "jotagezim", bio: "meu nome  joao grabiel tenho 17 anos e amo Jesus", isWhatsappPublic: false, createdAt: .now, avatar: "user2")
    ]
//    
    var fakePost : [Post] {
        return [
            .init(author: fakeUser[1], name: "Câmera Cybershot DSC-W620", desc: "eu ganhei essa câmera de aniversário de 17 anos, da minha tia Claudia. amei!", photo: "cybershot", preservation: 5, fields: []),
            .init(author: fakeUser[0], name: "Jogo GTA VI PS5", desc: "este disco foi encontrado na sede da ROckstar Games e é de extrema confidencialidade", photo: "disco", preservation: 5, fields: [.init(fieldName: "local", fieldValue: "porao da sede da rockstar")]),
            .init(author: fakeUser[1], name: "Mangá Haikyu!! 01", desc: "eu ganhei essa câmera de aniversário de 17 anos, da minha tia Claudia. amei!", photo: "manga", preservation: 4, fields: []),
            .init(author: fakeUser[0], name: "Mewtwo EX #282 Genetic Apex", desc: "este disco foi encontrado na sede da ROckstar Games e é de extrema confidencialidade", photo: "carta", preservation: 5, fields: [.init(fieldName: "local", fieldValue: "porao da sede da rockstar")])
        ]
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack(alignment: .top, spacing: 25) {
                    LazyVStack {
                        ForEach (fakePost.indices, id: \.self) { position in
                            if position % 2 == 0 {
                                NavigationLink(destination: PostExtendedView(post: fakePost[position])){
                                    PostView(post: fakePost[position])
                                }
                            }
                        }
                    }
                    LazyVStack {
                        ForEach (fakePost.indices, id: \.self) { position in
                            if position % 2 != 0 {
                                NavigationLink(destination: PostExtendedView(post: fakePost[position])){
                                    PostView(post: fakePost[position])
                                }
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
            .navigationTitle("Feed")
        }
        .searchable(text: $search, placement: .navigationBarDrawer(displayMode: .always), prompt: "Pesquise por um item...")
    }
}

#Preview {
    FeedView()
}

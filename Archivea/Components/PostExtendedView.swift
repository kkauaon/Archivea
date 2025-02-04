//
//  PostExtendedView.swift
//  Archivea
//
//  Created by found on 04/02/25.
//

import SwiftUI

struct PostExtendedView: View {
    
    @State var post : Post
    
    var body: some View {
        VStack {
            Image(post.photo)
        }
    }
}

#Preview {
    PostExtendedView(post: Post(author: User(name: "Kauã Sousa", handle: "kkauabr", bio: "entuasista", isWhatsappPublic: false, createdAt: .now, avatar: "user2"), name: "mewtwo ex edição limitada", desc: "este disco foi encontrado na sede da ROckstar Games e é de extrema confidencialidade", photo: "carta", preservation: 5, fields: [.init(fieldName: "local", fieldValue: "porao da sede da rockstar")]))
}


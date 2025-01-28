//
//  PostView.swift
//  Archivea
//
//  Created by found on 27/01/25.
//

import SwiftUI

struct PostView: View {
    @State var post : Post
    var body: some View {
        VStack(alignment: .leading) {
            Image(post.photo)
                .resizable()
                .cornerRadius(8)
                .scaledToFit()
//            HStack {
//                Image(post.author.avatar)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 24, height: 24)
//                    .clipShape(Circle())
//                Text("@"+post.author.handle)
//                    .font(.system(size: 12))
//            }
            //.padding(.horizontal, 12)
            .padding(.bottom, 25)
        }
    }
}

#Preview {
    PostView(post: .init(author: User(name: "João Gabriel", handle: "jotagezim", bio: "meu nome  joao grabiel tenho 17 anos e amo Jesus", isWhatsappPublic: false, createdAt: .now, avatar: "manga"), name: "camera cybershot dsc-w620", desc: "eu ganhei essa câmera de aniversário de 17 anos, da minha tia Claudia. amei!", photo: "cybershot", preservation: "ótimo", fields: []))
}

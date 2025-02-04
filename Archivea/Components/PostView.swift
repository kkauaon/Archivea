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
                .overlay(alignment: .topLeading) {
                    // Adiciona a borda do círculo primeiro
                    Circle()
                        .stroke(Color.white, lineWidth: 2)
                        .frame(width: 32, height: 32)
                        .padding(8)
                    Image(post.author.avatar)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                        .padding(8)
                    
                    
                }
            VStack(alignment: .leading) {
                Text(post.name)
                    .bold()
                    .font(.system(size: 17))
                    .lineLimit(1)
                HStack(spacing: 2) {
                    Text("Conservação: ")
                        .font(.system(size: 13))
                    Text(String(post.preservation))
                        .bold()
                        .font(.system(size: 12))
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size: 12))
                }
//                Text("@" + post.author.handle)
//                    .font(.system(size: 12))
            }
        }
        .padding(.bottom, 25)
    }
}

#Preview {
    PostView(post: .init(author: User(name: "João Gabriel", handle: "jotagezim", bio: "meu nome  joao grabiel tenho 17 anos e amo Jesus", isWhatsappPublic: false, createdAt: .now, avatar: "manga"), name: "camera cybershot dsc-w620", desc: "eu ganhei essa câmera de aniversário de 17 anos, da minha tia Claudia. amei!", photo: "cybershot", preservation: 5, fields: []))
}

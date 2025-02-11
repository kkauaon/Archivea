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
        ScrollView{
            VStack {
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
                }
            }.padding()
        }
    }
}

#Preview {
    PostExtendedView(post: Post(author: User(name: "Kauã Sousa", handle: "kkauabr", bio: "entuasista", isWhatsappPublic: false, createdAt: .now, avatar: "user2"), name: "mewtwo ex edição limitada", desc: "este disco foi encontrado na sede da ROckstar Games e é de extrema confidencialidade", photo: "carta", preservation: 5, fields: [.init(fieldName: "local", fieldValue: "porao da sede da rockstar")]))
}


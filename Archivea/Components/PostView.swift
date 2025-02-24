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
            
            //ELIS PEDIU PARA REMOVER A FOTO DE PERFIL DO USUÁRIO NO POSTVIEW.
            
            Image(post.photo)
                .resizable()
                .cornerRadius(8)
                .scaledToFit()
//                .overlay(alignment: .topLeading) {
//                    // Adiciona a borda do círculo primeiro
//                    Circle()
//                        .stroke(Color.white, lineWidth: 2)
//                        .frame(width: 32, height: 32)
//                        .padding(8)
//                    Image(post.author.avatar)
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 32, height: 32)
//                        .clipShape(Circle())
//                        .padding(8)
//                }
            
            VStack(alignment: .leading) {
                Text(post.name)
                    .bold()
                    .font(.system(size: 19))
                    .lineLimit(1)
                HStack(spacing: 2) {
                    Text(preservationToString(preservation: post.preservation))
                        .font(.system(size: 13))
                }
            }
        }
        .padding(.bottom, 25)
    }
}

#Preview {
    PostView(post: fakePosts.randomElement()!)
}

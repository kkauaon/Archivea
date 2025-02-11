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
            VStack (alignment: .leading, spacing: 7){
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
                
                HStack{
                    //Botão de adicionar aos favoritos
                    Button{
                        //Função de favoritar
                    }label: {
                        Image(systemName: "star")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 24, height: 24)
                    }
                    //Botão de compartilhar
                    Button{
                        //Função de compartilhar
                    }label: {
                        Image(systemName: "paperplane")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 24, height: 24)
                    }
                    
                    Spacer()
                    
                    //Botão de Solicitar Contato
                    Button{
                        //Função de Solicitar Contato
                    }label: {
                        Label("Solicitar contato", systemImage: "person.badge.plus.fill")
                            .foregroundColor(.black)
                            .padding(.horizontal, 8)
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.small)
                }
                
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading){
                        Text(post.name)
                            .bold()
                            .font(.system(size: 20))
                        Text("Conservação: \(preservationToString(preservation: post.preservation))")
                    }
                    
                    Text(post.desc)
                    
                    VStack(alignment: .leading){
                        ForEach (post.fields){ field in
                            Text("\(field.fieldName):  \(field.fieldValue)")
                        }
                    }
                }
            }.padding(.horizontal, 24)
        }
    }
}

#Preview {
    PostExtendedView(post: fakePosts.randomElement()!)
}


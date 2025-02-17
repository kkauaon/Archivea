//
//  PostExtendedView.swift
//  Archivea
//
//  Created by found on 04/02/25.
//


//ESSE FOI O QUE O DAVID AUGUSTO PROPÔS!!!
import SwiftUI
import SwiftData

struct PostExtendedView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query var favorites: [Favorite]
    
    @State var post : Post
    
    @State var isFavorited: Bool = false
    
    @State var favorite: Favorite? = nil
    
    @State var isFavoriteSelectionSheetPresented: Bool = false
    
    var body: some View {
        ScrollView{
            Image(post.photo)
                .resizable()
                .scaledToFit()
                .padding(.bottom, 16)
                .overlay(alignment: .topTrailing) {
                    
                    Button {
                        if isFavorited, let favorite {
                            modelContext.delete(favorite)
                        } else {
                            isFavoriteSelectionSheetPresented = true
                        }
                    } label: {
                        Circle()
                            .frame(width: 40, height: 40)
                            .padding(16)
                            .foregroundColor(.white)
                            .overlay(alignment: .center) {
                                Image(systemName: isFavorited ? "star.fill" : "star")
                                    .resizable()
                                    .frame(width: 22, height: 22)
                                    .foregroundColor(.black)
                            }
                    }
                }
            
            VStack (alignment: .leading, spacing: 16){
                HStack{
                    AvatarView(avatarData: UIImage(named: post.author.avatar)?.pngData(), avatarSize: .small)
                    VStack(alignment: .leading){
                        Spacer()
                        Text("\(post.author.name)")
                            .font(.system(size: 20))
                        Text("@\(post.author.handle)")
                            .font(.system(size: 16))
                        Spacer()
                    }
                    
                    
                    Spacer()
                    
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
                
                HStack {
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
                    Spacer()
                }
                
                HStack{
                    Spacer()
                    Text("Pertence à coleção")
                    NavigationLink {
                        FakeCollectionExtendedView(collection: post.collection)
                    } label: {
                        Text(post.collection.name)
                        Image(systemName: "chevron.right")
                    }
                    Spacer()
                }
                .padding(.bottom, 16)
                
            }.padding(.horizontal, 24)
        }
        // irá executar toda vez que o arrei de favoritos mudar
        .task(id: favorites) {
            if let favorite = favorites.first(where: { $0.post.id == post.id }) {
                self.favorite = favorite
                isFavorited = true
            } else {
                isFavorited = false
            }
        }
        .sheet(isPresented: $isFavoriteSelectionSheetPresented) { FavoriteFolderSelectionView(isPresented: $isFavoriteSelectionSheetPresented, post: post)
        }
    }
}

#Preview {
    PostExtendedView(post: fakePosts.randomElement()!)
}


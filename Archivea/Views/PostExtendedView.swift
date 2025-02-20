//ESSE FOI O QUE O DAVID AUGUSTO PROPÔS!!!
import SwiftUI
import SwiftData

struct PostExtendedView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query var favorites: [Favorite]
    
    @Query var folders: [FavoriteFolder]
    
    @State var post : Post
    
    @State var isFavorited: Bool = false
    
    @State var favorite: Favorite? = nil
    
    @State var isFavoriteSelectionSheetPresented: Bool = false
    
    @State var isAlertPresented: Bool = false
    
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
                            if !folders.isEmpty{
                                isFavoriteSelectionSheetPresented = true
                            }else{
                                isAlertPresented = true
                            }
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
                NavigationLink {
                    ProfileView(profile: post.author)
                } label: {
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
                .buttonStyle(.plain)
                
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
                    if post.author.isWhatsappPublic{
                        Link (destination: URL(string: "https://wa.me//55\(post.author.phone)?text=Olá \(post.author.name), vi seu item \(post.name) no Archivea e tenho interesse em trocar com você.")!, label: {
                            Label("Solicitar Contato", systemImage: "person.badge.plus.fill")
                                .foregroundColor(.black)
                        })
                        .buttonStyle(.bordered)
                        .controlSize(.small)
                    }
                        
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
        .navigationTitle("Post")
        .navigationBarTitleDisplayMode(.inline)
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
        .alert(Text("Sem pastas de favoritos"), isPresented: $isAlertPresented) {
            Button("Ok") {
                isAlertPresented = false
            }
        } message: {
            Text("Parece que você ainda não possui nenhuma pasta de favoritos!\nNa barra inferior, vá em Favoritos e aperte no botão + para adicionar uma nova pasta de favoritos!")
        }
    }
}

#Preview {
    NavigationView {
        PostExtendedView(post: fakePosts.randomElement()!)
    }
}


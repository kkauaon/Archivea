//
//  MyProfileView.swift
//  Archivea
//
//  Created by found on 31/01/25.
//

import SwiftUI
import SwiftData

struct MyProfileView: View {
    @Environment(\.modelContext) var modelContext
    
    @State var profile : MyProfile
    
    @Query(sort: \Collection.name, order: .forward) var allCollections : [Collection]
    
    @State var collections : [Collection] = []
    
    @State var addNewCollectionViewIsPresented = false
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
   
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    HStack(alignment: .top){
                        AvatarView(avatarData: profile.avatar, avatarSize: .small)
                        VStack(alignment: .leading){
                            Spacer()
                            Text("\(profile.name)")
                                .font(.system(size: 24))
                                .lineLimit(1)
                            Text("@\(profile.handle)")
                                .font(.system(size: 16))
                                .lineLimit(1)
                                .onTapGesture {
                                    createDemoPosts()
                                }
                            Spacer()
                        }
                        Spacer()
                        
                        //Botão de Configuraões cancelado.
                        NavigationLink {
                            ConfigView(profile: profile)
                        }label: {
                            Image(systemName: "gear")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 32, height: 32)
                        }
                    }
                    Text("\(profile.bio)")
                        .font(.system(size: 17))
                        .lineLimit(8)
                    //Botao de editar perfil
                    NavigationLink {
                        EditProfileView(profile: $profile)
                    } label: {
                        Text("Editar perfil")
                            .foregroundColor(.black)
                            .padding(.horizontal, 20)
                    }
                    .buttonStyle(.bordered)
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        HStack{
                            Text("Coleções")
                                .font(.system(size: 24))
                            Spacer()
                            Button {
                                addNewCollectionViewIsPresented = true
                            } label: {
                                Image(systemName: "plus")
                                    .resizable()
                                    .foregroundColor(.black)
                                    .frame(width: 20, height: 20)
                            }
                        }
                    }
                    
                }
                
                LazyVGrid(columns: columns){
                    ForEach(collections) { collection in
                        NavigationLink(destination: CollectionExtendedView(collection: collection)){
                            CollectionView(collection: collection)
                        }
                        //Isso aqui foi necessário para os textos relativos à essa Navigation não ficarem azuis!
                        .buttonStyle(.plain)
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .navigationTitle("Seu Perfil")
            .navigationBarHidden(true)
            .scrollIndicators(.never)
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .top
            )
            .padding(.horizontal, 16)
            .sheet(isPresented: $addNewCollectionViewIsPresented) {
                AddNewCollectionView(profile: profile)
            }
            .task(id: allCollections) {
                print("Coleçoes mudaram, atualizando..")
                
                collections = allCollections.filter { $0.author.id == profile.id }
                
               
                
                collections.sort(by: { $0.name < $1.name })
            }
            //.navigationTitle("\(profile.name)")
        }
    }
    
    func createDemoPosts() {
        if profile.handle == "jotagezim", !collections.contains(where: { $0.name == "Mídia e Entretenimento"}) {
            // Step 1: Filter collections
            let filteredCollections = fakeCollections.filter { $0.author.handle == "jotagezim" }
            
            // Step 2: Transform filtered collections
            let collectionsToAdd = filteredCollections.map { fakeCollectionToRealCollection(fake: $0) }
            
            // Step 3: Insert collections
            for collection in collectionsToAdd {
                print("Inserindo \(collection.name)")
                collection.author = profile
                modelContext.insert(collection)
            }
            
            collections = allCollections.filter { $0.author.id == profile.id }
            collections.sort(by: { $0.name < $1.name })
            
            // Step 4: Filter posts
            let filteredPosts = fakePosts.filter { $0.author.handle == "jotagezim" }
            
            // Step 5: Transform filtered posts
            let postsToAdd = filteredPosts.map { postToItemCollection(post: $0) }
            
            // Step 6: Insert posts
            for post in postsToAdd {
                print("Inserindo \(post.name) -> \(post.collection.name)")
                if let collection = collections.first(where: { $0.author.id == profile.id && $0.name == post.collection.name }) {
                    print("----> \(collection.name)")
                    post.collection = collection
                    modelContext.insert(post)
                } else {
                    print("----> Sem coleçao...")
                }
            }
        }
    }
}

#Preview {
    MyProfileView(profile: previewMyProfile)
        .modelContainer(for: [MyProfile.self, Collection.self, ItemCollection.self])
}

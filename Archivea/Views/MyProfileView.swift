//
//  MyProfileView.swift
//  Archivea
//
//  Created by found on 31/01/25.
//

import SwiftUI
import SwiftData

struct MyProfileView: View {
    @State var profile : MyProfile
    
    @Query(sort: \Collection.name, order: .forward) var collections : [Collection]
    
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
                            Text("@\(profile.handle)")
                                .font(.system(size: 16))
                            Spacer()
                        }
                        Spacer()
                        
                        //Botão de Configuraões cancelado.
                        NavigationLink {
                            ConfigView()
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
                        Text("Coleções")
                            .font(.system(size: 24))
                        HStack{
                            Text("Adicionar coleção")
                                .font(.system(size: 20))
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
                AddNewCollectionView()
            }
            .task(id: collections) {
                print("---------------")
                for collection in collections {
                    
                    print(collection.name)
                }
                print("---------------")
            }
            //.navigationTitle("\(profile.name)")
        }
    }
}

#Preview {
    MyProfileView(profile: .init(name: "Kauã Sousa", handle: "kkauabr", bio: "Lorem ipsum nulla vestibulum convallis phasellus donec felis, morbi.", isWhatsappPublic: true, createdAt: .now, avatar: nil, phone: "85992076620"))
        .modelContainer(for: [MyProfile.self, Collection.self, ItemCollection.self])
}

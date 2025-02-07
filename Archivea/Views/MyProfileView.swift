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
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
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
                    Button{
                        //DEFINIR ACAO DESSE BOTAO AQUI, ELE ABRIRA UMA BARRA LATERAL DE CONFIGURACOES. SERA UM XITE.
                    }label: {
                        Image(systemName: "gear")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 32, height: 32)
                    }
                }
                HStack(){
                    Text("\(profile.bio)")
                        .font(.system(size: 17))
                    Spacer()
                }
                HStack{
                    //Botao de editar perfil
                    NavigationLink {
                        EditProfileView(profile: $profile)
                    } label: {
                        Text("Editar perfil")
                            .foregroundColor(.black)
                            .padding(.horizontal, 28)
                    }
                    .buttonStyle(.bordered)
                    
                    Spacer()
                    //Botao de adicionar uma nova colecao
                    Button{
                        addNewCollectionViewIsPresented = true
                    }label: {
                        Label("Nova coleção", systemImage: "plus")
                            .foregroundColor(.black)
                            .padding(.horizontal, 8)
                    }
                    .buttonStyle(.bordered)
                }
                Divider()
                HStack {
                    Text("Coleções")
                        .font(.system(size: 20))
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 24, height: 16)
                    }
                }
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        ForEach (collections, id: \.self.id) { collection in
                            
                            if let index = collections.firstIndex(where: { $0.id == collection.id }), index % 2 == 0 {
                                CollectionView(collection: collections[index])
                            }
                        }
                    }
                    Spacer()
                    if collections.count > 1 {
                        VStack {
                            ForEach (collections, id: \.self.id) { collection in
                                
                                if let index = collections.firstIndex(where: { $0.id == collection.id }), index % 2 != 0 {
                                    CollectionView(collection: collections[index])
                                }
                            }
                        }
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
    MyProfileView(profile: .init(name: "Kauã Sousa", handle: "kkauabr", bio: "entuasista", isWhatsappPublic: true, createdAt: .now, avatar: nil))
        .modelContainer(for: [MyProfile.self, Collection.self, ItemCollection.self])
}

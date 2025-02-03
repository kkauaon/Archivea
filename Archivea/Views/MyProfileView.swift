//
//  MyProfileView.swift
//  Archivea
//
//  Created by found on 31/01/25.
//

import SwiftUI
import SwiftData

struct MyProfileView: View {
    var profile : MyProfile
    
    @Query var collections : [Collection]
    
    @State var addNewCollectionViewIsPresented = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack(alignment: .top){
                    if let avatar = profile.avatar, let image = UIImage(data: avatar) {
                        Image(uiImage: image)
                            .resizable()
                            .cornerRadius(5)
                            .frame(width: 64, height: 64)
                    } else {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.gray)
                            .frame(width: 64, height: 64)
                            .overlay {
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .frame(width: 48, height: 48)
                                
                            }
                    }
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
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 24, height: 24)
                    }
                }
                HStack(){
                    Text("\(profile.bio)")
                        .font(.system(size: 16).weight(.light))
                    Spacer()
                }
                HStack{
                    //Botao de editar perfil
                    Button{
                        
                    }label: {
                        Text("Editar perfil")
                            .foregroundColor(.black)
                            .padding(.horizontal, 28)
                    }.buttonStyle(.bordered)
                    
                    Spacer()
                    //Botao de adicionar uma nova colecao
                    Button{
                        addNewCollectionViewIsPresented = true
                    }label: {
                        Label("Nova coleção", systemImage: "plus")
                            .foregroundColor(.black)
                            .padding(.horizontal, 8)
                    }.buttonStyle(.bordered)
                }
                Divider()
                HStack(alignment: .top, spacing: 25) {
                    VStack {
                        ForEach (collections, id: \.self.id) { col in
                            
                            if let i = collections.firstIndex(where: { $0.id == col.id }), i == 0 {
                                CollectionView(collection: collections[i])
                            }
                        }
                    }
                    if collections.count > 1 {
                        VStack {
                            ForEach (collections, id: \.self.id) { col in
                                
                                if let i = collections.firstIndex(where: { $0.id == col.id }) != 0 {
                                    CollectionView(collection: collections[i])
                                }
                            }
                        }
                    }
                }
            }
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
                print("---")
                for collection in collections {
                    
                    print(collection.name)
                }
                print("---")
            }
        }
    }
}

#Preview {
    MyProfileView(profile: .init(name: "Kauã Sousa", handle: "kkauabr", bio: "entuasista", isWhatsappPublic: true, createdAt: .now, avatar: nil))
}

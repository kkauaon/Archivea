//
//  MyProfileView.swift
//  Archivea
//
//  Created by found on 31/01/25.
//

import SwiftUI
import SwiftData

struct ProfileView: View {
    @State var profile : User
    
    @State var collections: [FakeCollection] = []
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .top){
                    AvatarView(avatarData: UIImage(named:profile.avatar)?.pngData(), avatarSize: .small)
                    VStack(alignment: .leading){
                        Spacer()
                        Text("\(profile.name)")
                            .font(.system(size: 24))
                        Text("@\(profile.handle)")
                            .font(.system(size: 16))
                        Spacer()
                    }
                }
                Text("\(profile.bio)")
                    .font(.system(size: 17))
                    .lineLimit(8)
                //Botao de editar perfil
                Button {
                    // Ação do botão
                } label: {
                    Link(destination: URL("https://wa.me/\(profile.phone)"))
                }

                .buttonStyle(.bordered)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Coleções")
                        .font(.system(size: 24))
                }
                
            }
            
            LazyVGrid(columns: columns){
                ForEach(collections) { collection in
                    NavigationLink(destination: FakeCollectionExtendedView(collection: collection)){
                        CollectionView(collection: fakeCollectionToRealCollection(fake: collection), editable: false)
                    }
                    //Isso aqui foi necessário para os textos relativos à essa Navigation não ficarem azuis!
                    .buttonStyle(.plain)
                }
            }
        }
        .navigationTitle("Perfil")
        .scrollIndicators(.never)
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .top
        )
        .padding(.horizontal, 16)
        .task(id: collections) {
            collections = fakeCollections.filter { $0.author.id == profile.id }
        }
        //.navigationTitle("\(profile.name)")
    }
    
}

#Preview {
    NavigationView {
        ProfileView(profile: fakeUser.randomElement()!)
    }
}

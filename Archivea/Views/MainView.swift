//
//  MainView.swift
//  Archivea
//
//  Created by found on 27/01/25.
//

import SwiftUI
import SwiftData

struct MainView: View {
    
    @State var isLogged : Bool = true
    
    var body: some View {
        if isLogged {
            TabView{
                FeedView()
                    .tabItem{
                        Label("Feed", systemImage: "book.fill")
                    }
                FavoritesView()
                    .tabItem{
                        Label("Favoritos", systemImage: "star")
                    }
                MyProfileView(profile: .init(name: "Kauã Sousa", handle: "kkauabr", bio: "Sou desenvolvedor desde os 2 anos de idade, e adoro colecionar coisas!", isWhatsappPublic: true, createdAt: .now, avatar: nil))
                    .tabItem{
                        Label("Perfil", systemImage: "person.crop.circle")
                    }
            }
        } else {
            LoginRegisterView(isLogged: $isLogged)
        }
    }
}

#Preview {
    MainView()
        .modelContainer(for: [ItemCollection.self, Collection.self, MyProfile.self], inMemory: false)
}


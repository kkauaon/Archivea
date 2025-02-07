//
//  MainView.swift
//  Archivea
//
//  Created by found on 27/01/25.
//

import SwiftUI
import SwiftData

struct MainView: View {
    var body: some View {
        TabView{
            FeedView()
                .tabItem{
                    Label("Feed", systemImage: "book.fill")
            }
            FavoritesView()
                .tabItem{
                    Label("Favoritos", systemImage: "star")
                }
            MyProfileView(profile: .init(name: "Kauã Sousa", handle: "kkauabr", bio: "entuasista", isWhatsappPublic: true, createdAt: .now, avatar: nil))
                .tabItem{
                    Label("Perfil", systemImage: "person.crop.circle")
                }
        }
    }
}

#Preview {
    MainView()
        .modelContainer(for: [ItemCollection.self, Collection.self, MyProfile.self], inMemory: false)
}


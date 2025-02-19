//
//  MainView.swift
//  Archivea
//
//  Created by found on 27/01/25.
//

import SwiftUI
import SwiftData

struct MainView: View {
    
    @Query var profiles : [MyProfile]
    
    var body: some View {
        if !profiles.isEmpty {
            TabView{
                FeedView()
                    .tabItem{
                        Label("Feed", systemImage: "book.fill")
                    }
                FavoritesView()
                    .tabItem{
                        Label("Favoritos", systemImage: "star")
                    }
                MyProfileView(profile: profiles.first!)
                    .tabItem{
                        Label("Perfil", systemImage: "person.crop.circle")
                    }
            }
        } else {
            LoginRegisterView()
        }
    }
}

#Preview {
    MainView()
        .modelContainer(for: [ItemCollection.self, Collection.self, MyProfile.self], inMemory: false)
}


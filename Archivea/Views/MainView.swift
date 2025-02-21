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
    
    @State var currentProfile : MyProfile?
    
    var body: some View {
        ZStack {
            if let profile = currentProfile {
                TabView{
                    FeedView()
                        .tabItem{
                            Label("Feed", systemImage: "book.fill")
                        }
                    FavoritesView(profile: profile)
                        .tabItem{
                            Label("Favoritos", systemImage: "star")
                        }
                    MyProfileView(profile: profile)
                        .tabItem{
                            Label("Perfil", systemImage: "person.crop.circle")
                        }
                }
            } else {
                LoginRegisterView()
            }
        }
        .task(id: profiles) {
            if let profile = profiles.first(where: { $0.isLogged }) {
                currentProfile = profile
            } else {
                currentProfile = nil
            }
        }
    }
}

#Preview {
    MainView()
        .modelContainer(for: [ItemCollection.self, Collection.self, MyProfile.self], inMemory: false)
}


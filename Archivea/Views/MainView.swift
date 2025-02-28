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
    
    @EnvironmentObject private var loginManager: LoginManager
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @State private var selectedItem: String? = "Feed"
    
    var body: some View {
        ZStack {
            if let profile = loginManager.profile {
                if horizontalSizeClass == .regular {
                    // iPad layout with NavigationSplitView
                    NavigationSplitView {
                        List(selection: $selectedItem) {
                            NavigationLink(value: "Feed") {
                                Label("Feed", systemImage: "book.fill")
                            }
                            NavigationLink(value: "Favoritos") {
                                Label("Favoritos", systemImage: "star")
                            }
                            NavigationLink(value: "Perfil") {
                                Label("Perfil", systemImage: "person.crop.circle")
                            }
                        }
                        .navigationTitle("Menu")
                    } detail: {
                        switch selectedItem {
                        case "Feed":
                            FeedView(profile: profile)
                        case "Favoritos":
                            FavoritesView(profile: profile)
                        case "Perfil":
                            MyProfileView(profile: profile)
                        default:
                            FeedView(profile: profile) // Fallback para o feed
                        }
                    }
                } else {
                    // iPhone layout with TabView
                    TabView {
                        FeedView(profile: profile)
                            .tabItem {
                                Label("Feed", systemImage: "book.fill")
                            }
                        FavoritesView(profile: profile)
                            .tabItem {
                                Label("Favoritos", systemImage: "star")
                            }
                        MyProfileView(profile: profile)
                            .tabItem {
                                Label("Perfil", systemImage: "person.crop.circle")
                            }
                    }
                }
            } else {
                LoginRegisterView()
            }
        }
        .task(id: profiles) {
            if let profile = profiles.first(where: { $0.isLogged }) {
                loginManager.login(profile: profile)
            }
        }
    }
}

#Preview {
    MainView()
        .modelContainer(for: [ItemCollection.self, Collection.self, MyProfile.self, FavoriteFolder.self, Favorite.self], inMemory: false)
}


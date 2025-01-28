//
//  MainView.swift
//  Archivea
//
//  Created by found on 27/01/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            NotificationsView()
                .tabItem{
                    Label("Notificações", systemImage: "bell")
                }
                
            FeedView()
                .tabItem{
                    Label("Feed", systemImage: "house")
                }
            ProfileView()
                .tabItem{
                    Label("Perfil", systemImage: "person.crop.circle")
                }
        }
    }
}

#Preview {
    MainView()
}


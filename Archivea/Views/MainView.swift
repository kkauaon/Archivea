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
            MyProfileView(profile: .init(name: "Kauã Sousa", handle: "kkauabr", bio: "entuasista", isWhatsappPublic: true, createdAt: .now, avatar: nil))
                .tabItem{
                    Label("Perfil", systemImage: "person.crop.circle")
                }
        }
    }
}

#Preview {
    MainView()
}


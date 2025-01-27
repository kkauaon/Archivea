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
                    Image(systemName: "bell")
                }
            FeedView()
                .tabItem{
                    Image(systemName: "house")
                }
            ProfileView()
                .tabItem{
                    Image(systemName: "person.crop.circle")
                }
        }
    }
}

#Preview {
    MainView()
}


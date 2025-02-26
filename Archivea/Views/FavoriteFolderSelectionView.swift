//
//  FavoriteFolderSelectionView.swift
//  Archivea
//
//  Created by found on 17/02/25.
//

import SwiftUI
import SwiftData

struct FavoriteFolderSelectionView: View {
    
    @Binding var isPresented: Bool
    @State var post: Post
    @Query(sort: \FavoriteFolder.name, order: .forward) var allFolders : [FavoriteFolder]
    
    @State var folders : [FavoriteFolder] = []
    
    @State var addNewFavoriteFolderIsPresented:Bool = false
    @EnvironmentObject private var loginManager: LoginManager
    
    var body: some View {
        ScrollView{
            ForEach(folders) { folder in
                VStack(alignment: .leading) {
                    FavoriteFolderInSelectionView(folder: folder, post: post, isPresented: $isPresented)
                    Divider()
                }
            }
        }
        .task(id: allFolders) {
            folders = allFolders.filter { $0.author.id == loginManager.profile!.id }
            
            folders.sort(by: { $0.name < $1.name })
        }
        .littleSheet(height: 550, title: "Favoritos", toolbarText: "Nova Pasta", padding: 16) {
            addNewFavoriteFolderIsPresented = true
        }
        .sheet(isPresented: $addNewFavoriteFolderIsPresented) {
            AddNewFavoriteFolderView(profile: loginManager.profile!)
        }
    }
}

#Preview {
    FavoriteFolderSelectionView(isPresented: .constant(true), post: fakePosts.randomElement()!)
        .environmentObject(LoginManager(profile: previewMyProfile))
        .modelContainer(for: FavoriteFolder.self)
}

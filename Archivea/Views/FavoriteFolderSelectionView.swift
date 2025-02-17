//
//  FavoriteFolderSelectionView.swift
//  Archivea
//
//  Created by found on 17/02/25.
//

import SwiftUI
import SwiftData

struct FavoriteFolderSelectionView: View {
    
    @Binding var isPresented:Bool
    @State var post: Post
    @Query var folders : [FavoriteFolder]
    
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(folders) { folder in
                    VStack(alignment: .leading) {
                        FavoriteFolderInSelectionView(folder: folder, post: post, isPresented: $isPresented)
                        Divider()
                    }
                }
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .padding(16)
            .navigationTitle("Favoritos")
            .navigationBarTitleDisplayMode(.inline)
        }
        .presentationDetents([.height(550), .large])
        .presentationCornerRadius(20)
    }
}

#Preview {
    FavoriteFolderSelectionView(isPresented: .constant(true), post: fakePosts.randomElement()!)
}

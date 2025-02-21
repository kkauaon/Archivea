//
//  CollectionExpandedView.swift
//  Archivea
//
//  Created by found on 13/02/25.
//

import SwiftUI
import SwiftData

struct FavoriteFolderExtendedView: View {
    
    @State var folder : FavoriteFolder
    
    @State var postsFromCollection: [Favorite] = []
    
    @Query var favorites: [Favorite]
    
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 20) {
                ForEach(postsFromCollection, id: \.self.id) { item in
                    NavigationLink(destination: PostExtendedView(post: item.post)) {
                        //A função postToItemCollection está sendo usada para converter um post para um item de coleção. Assim, podemos utilizar a mesma view, ItemCollectionView, para colocar nas coleções fakes.
                        ItemCollectionView(itemCollection: postToItemCollection(post: item.post), editable: false)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .task {
            postsFromCollection = favorites.filter { $0.folder.id == folder.id }
        }
        .scrollIndicators(.never)
        .padding(.horizontal, 16)
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .top
        )
        .navigationTitle(folder.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        FavoriteFolderExtendedView(folder: .init(name: "Carrinhos", author: previewMyProfile))
    }
}

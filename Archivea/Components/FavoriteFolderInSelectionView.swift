//
//  FavoriteFolderInSelectionView.swift
//  Archivea
//
//  Created by found on 17/02/25.
//

import SwiftUI
import SwiftData

struct FavoriteFolderInSelectionView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @State var folder: FavoriteFolder
    @State var post: Post
    
    @Binding var isPresented: Bool
    
    @Query var favorites: [Favorite]
    
    var body: some View {
        Button {
            if !favorites.contains(where: { $0.post.id == post.id && $0.folder.id == folder.id }) {
                let newFavorite = Favorite(post: post, folder: folder)
                
                modelContext.insert(newFavorite)
                
                isPresented = false
            }
        } label: {
            HStack(alignment: .top){
                RoundedRectangle(cornerRadius: 5)
                    .noPhotoOverlay(topPadding: 0, size: 30)
                    .frame(width: 125, height: 90)
                    .overlay {
                        if let data = folder.image, let image = UIImage(data: data) {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 125, height: 90)
                                .cornerRadius(5)
                                .clipped()
                                //.allowsHitTesting(false)
                        }
                    }
                VStack (alignment: .leading){
                    Text(folder.name)
                        .font(.system(size: 20))
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.leading)
                    Text("\(favorites.count(where: { $0.folder.id == folder.id })) itens")
                        .foregroundStyle(.gray)
                }
            }
        }
    }
}

#Preview {
    FavoriteFolderInSelectionView(folder: .init(name: "Carrinhos", image: nil, author: previewMyProfile), post: fakePosts.randomElement()!, isPresented: .constant(true))
}

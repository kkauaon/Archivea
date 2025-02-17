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
            if !favorites.contains(where: { $0.post == post }) {
                modelContext.insert(Favorite(post: post, folder: folder))
                
                isPresented = false
            }
        } label: {
            HStack(alignment: .top){
                RoundedRectangle(cornerRadius: 5)
                    .fill(.gray)
                    .frame(width: 125, height: 90)
                    .overlay {
                        Image(systemName: "photo.badge.plus.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 48)
                    }
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
                    Text("\(favorites.count(where: { $0.folder.id == folder.id })) itens")
                        .foregroundStyle(.gray)
                }
            }
        }
    }
}

#Preview {
    FavoriteFolderInSelectionView(folder: .init(name: "Carrinhos", image: nil), post: fakePosts.randomElement()!, isPresented: .constant(true))
}

//
//  CollectionView.swift
//  Archivea
//
//  Created by found on 31/01/25.
//

import SwiftUI
import SwiftData

struct FavoriteFolderView: View {
    @Environment(\.modelContext) var modelContext
    
    @State var folder: FavoriteFolder
    
    @Query var items: [Favorite]
    @State var itemsFromFolder: [Favorite] = []
    
    @State var isSheetPresented: Bool = false
    
    var body: some View {
            VStack {
                RoundedRectangle(cornerRadius: 5)
                        .fill(.gray)
                        .frame(height: 130)
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
                                    .frame(height: 130)
                                    .cornerRadius(5)
                                    .clipped()
                                    .allowsHitTesting(false)
                            }
                        }
                        
                HStack{
                    Text(folder.name)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button {
                        isSheetPresented = true
                    } label: {
                        Image(systemName: "pencil")
                            .foregroundColor(.black)
                            .padding(5)
                    }
                }
            }
            .sheet(isPresented: $isSheetPresented) {
                EditFavoriteFolderView(folder: folder)
            }
    }
}
#Preview {
    FavoriteFolderView(folder: FavoriteFolder(name: "Desejos"))
}

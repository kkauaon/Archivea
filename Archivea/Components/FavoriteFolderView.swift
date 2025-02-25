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
                                .foregroundStyle(.black)
                        }
                        .overlay {
                            if let data = folder.image, let image = UIImage(data: data) {
                                GeometryReader { sizes in
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: sizes.size.width, height: 130)
                                        .cornerRadius(5)
                                        .clipped()
                                        .allowsHitTesting(false)
                                }
                            }
                        }
                        
                HStack{
                    VStack(alignment: .leading){
                        Text(folder.name)
                            .foregroundColor(.black)
                            .lineLimit(1)
                            .multilineTextAlignment(.leading)
                        Text("\(itemsFromFolder.count) itens")
                            .foregroundStyle(.gray)
                    }
                    
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
            .task(id: items) {
                itemsFromFolder.removeAll()
                
                for item in items {
                    if item.folder.id == folder.id {
                        itemsFromFolder.append(item)
                    }
                }
            }
            .sheet(isPresented: $isSheetPresented) {
                EditFavoriteFolderView(folder: folder)
            }
    }
}
#Preview {
    FavoriteFolderView(folder: FavoriteFolder(name: "Desejos", author: previewMyProfile))
}

//
//  CollectionView.swift
//  Archivea
//
//  Created by found on 31/01/25.
//

import SwiftUI
import SwiftData

struct CollectionView: View {
    
    
    @Environment(\.modelContext) var modelContext

    
    @State var collection: Collection
    
    @Query var items: [ItemCollection]
    @State var itemsFromCollection: [ItemCollection] = []
    
    @State var isSheetPresented: Bool = false
    
    @State var editable : Bool = true
    
    var body: some View {
            VStack {
                RoundedRectangle(cornerRadius: 5)
                    .noPhotoOverlay()
                        .frame(height: 130)
                        .overlay {
                            if let data = collection.image, let image = UIImage(data: data) {
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
                        Text(collection.name)
                            .lineLimit(1)
                            .foregroundColor(.black)
                        Text("\(itemsFromCollection.count) itens")
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                    
                    if editable {
                        Button {
                            isSheetPresented = true
                        } label: {
                            Image(systemName: "pencil")
                                .foregroundColor(.black)
                                .padding(5)
                        }
                    }
                }
            }
            .task(id: items) {
                itemsFromCollection.removeAll()
                
                for item in items {
                    if item.collection.id == collection.id {
                        itemsFromCollection.append(item)
                    }
                }
            }
            .sheet(isPresented: $isSheetPresented) {
                EditCollectionView(collection: collection)
            }
            //frame(maxWidth: 400)
    }
}
#Preview {
    CollectionView(collection: .init(name: "Coleção Teste", isPrivate: false, image: nil, author: previewMyProfile))
}

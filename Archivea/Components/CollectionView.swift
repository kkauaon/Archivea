//
//  CollectionView.swift
//  Archivea
//
//  Created by found on 31/01/25.
//

import SwiftUI
import SwiftData

struct CollectionView: View {
    @State var collection: Collection
    
    @Query var items: [ItemCollection]
    @State var itemsFromCollection: [ItemCollection] = []
    
    
    var body: some View {
        VStack {
            if itemsFromCollection.count > 0, let data = itemsFromCollection.first!.photo, let image = UIImage(data: data) {
                Image(uiImage: image)
                    .resizable()
                    .cornerRadius(5)
                    .frame(width: 64, height: 64)
            } else {
                RoundedRectangle(cornerRadius: 5)
                .fill(.gray)
                .frame(width: 64, height: 64)
                .overlay {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 48, height: 48)
                    
                }
            }

            Text(collection.name)
        }
        .task {
            for item in items {
                if item.collection.id == collection.id {
                    itemsFromCollection.append(item)
                }
            }
        }
    }
}

#Preview {
    CollectionView(collection: .init(name: "kiko da silva"))
}

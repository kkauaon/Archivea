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
    
    
    var body: some View {
        VStack {
            if let data = collection.image, let image = UIImage(data: data) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 130)
                    .cornerRadius(5)
                    .clipped()
                    .allowsHitTesting(false)
            } else {
                RoundedRectangle(cornerRadius: 5)
                .fill(.gray)
                .frame(height: 130)
                .overlay {
                    Image(systemName: "photo.badge.plus.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48)
                }
            }
            HStack{
                Text(collection.name)
                
                Spacer()
                
                Button {
                    isSheetPresented = true
                } label: {
                    Image(systemName: "pencil")
                        .foregroundColor(.black)
                        .padding(5)
                }
                //
            }
        }
        .sheet(isPresented: $isSheetPresented) {
            EditCollectionView(collection: collection)
        }
        //.frame(width: 190)
    }
}

#Preview {
    CollectionView(collection: .init(name: "Coleção Teste", isPrivate: false, image: nil))
}

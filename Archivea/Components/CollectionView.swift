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
                        .fill(.gray)
                        .frame(height: 130)
                        .overlay {
                            Image(systemName: "photo.badge.plus.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 48)
                        }
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
                    Text(collection.name)
                        .lineLimit(1)
                        .foregroundColor(.black)
                    
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
            .sheet(isPresented: $isSheetPresented) {
                EditCollectionView(collection: collection)
            }
    }
}
#Preview {
    CollectionView(collection: .init(name: "Coleção Teste", isPrivate: false, image: nil))
}

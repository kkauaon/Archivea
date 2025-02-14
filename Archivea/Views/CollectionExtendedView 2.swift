//
//  CollectionExpandedView.swift
//  Archivea
//
//  Created by found on 13/02/25.
//

import SwiftUI
import SwiftData

struct CollectionExtendedView: View {
    
    @State var collection : Collection
    
    @Query var items: [ItemCollection]
    @State var itemsFromCollection: [ItemCollection] = []
    
    @State var addNewItemCollectionViewIsPresented : Bool = false
    
    var body: some View {
        ScrollView {
            HStack{
                Text("Adicionar novo item")
                    .font(.system(size: 20))
                Spacer()
                Button {
                    addNewItemCollectionViewIsPresented = true
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 20, height: 20)
                }
            }
            
            VStack(spacing: 20) {
                ForEach(itemsFromCollection, id: \.self.id) { item in
                    ItemCollectionView(itemCollection: item)
                }
            }
        }
        .scrollIndicators(.never)
        .padding(.horizontal, 16)
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .top
        )
        .task(id: items) {
            itemsFromCollection.removeAll()
            
            for item in items {
                if item.collection.id == collection.id {
                    itemsFromCollection.append(item)
                }
            }
        }
        .sheet(isPresented: $addNewItemCollectionViewIsPresented) {
            AddNewItemCollectionView(itemCollection: .init(name: "", desc: "", photo: nil, fields: [], collection: collection))
        }
        .navigationTitle(collection.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CollectionExtendedView(collection: .init(name: "ColeçãoTeste"))
}

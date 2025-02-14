//
//  CollectionExpandedView.swift
//  Archivea
//
//  Created by found on 13/02/25.
//

import SwiftUI
import SwiftData

struct FakeCollectionExtendedView: View {
    
    @State var collection : Collection
    
    @State var itemsFromCollection: [ItemCollection] = []
    
    
    var body: some View {
        ScrollView {
            
            
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
        .task {
            //itemsFromCollection = fakePosts.filter { $0.collection.name == collection.name }
        }
        .navigationTitle(collection.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FakeCollectionExtendedView(collection: .init(name: "ColeçãoTeste"))
}

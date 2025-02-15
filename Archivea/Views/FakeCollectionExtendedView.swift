//
//  CollectionExpandedView.swift
//  Archivea
//
//  Created by found on 13/02/25.
//

import SwiftUI
import SwiftData

struct FakeCollectionExtendedView: View {
    
    @State var collection : FakeCollection
    
    @State var postsFromCollection: [Post] = []
    
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 20) {
                ForEach(postsFromCollection, id: \.self.id) { item in
                    NavigationLink(destination: PostExtendedView(post: item)) {
                        ItemCollectionView(itemCollection: postToItemCollection(post: item), editable: false)
                    }
                    .buttonStyle(.plain)
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
            postsFromCollection = fakePosts.filter { $0.collection.id == collection.id }
            
            postsFromCollection.sort(by: { $0.name < $1.name })
        }
        .navigationTitle(collection.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        FakeCollectionExtendedView(collection: fakeCollections.randomElement()!)
    }
}

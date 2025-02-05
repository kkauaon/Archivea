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
    
    @State var isPopoverPresented: Bool = false
    
    
    var body: some View {
        VStack {
            if itemsFromCollection.count > 0, let data = itemsFromCollection.first!.photo, let image = UIImage(data: data) {
                Image(uiImage: image)
                    .resizable()
                    .cornerRadius(5)
                    .frame(height: 150)
            } else {
                RoundedRectangle(cornerRadius: 5)
                .fill(.gray)
                .frame(height: 150)
                .overlay {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 48, height: 48)
                    
                }
            }
            HStack{
                Text(collection.name)
                
                Spacer()
                
                Menu("", systemImage: "pencil"){
                    Button{
                        //CollectionManager()
                    }label:{
                        Text("Gerenciar coleção")
                    }
                    Button(role:.destructive){
                        modelContext.delete(collection)
                    }label:{
                        Text("Deletar coleção")
                    }
                }
                .foregroundColor(.black)
            }
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
    CollectionView(collection: .init(name: "Colecao Teste", isPrivate: false, image: nil))
}

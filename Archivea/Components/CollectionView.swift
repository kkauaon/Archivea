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
            if let data = collection.image, let image = UIImage(data: data) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 170, height: 130)
                    .cornerRadius(5)
                    .clipped()
            } else {
                RoundedRectangle(cornerRadius: 5)
                .fill(.gray)
                .frame(height: 130)
                .overlay {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 48, height: 48)
                    
                }
            }
            HStack{
                Text(collection.name)
                
                Spacer()
                
                Menu {
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
                } label: {
                    Image(systemName: "pencil")
                        .foregroundColor(.black)
                }
                //
            }
        }
//        .task {
//            for item in items {
//                if item.collection.id == collection.id {
//                    itemsFromCollection.append(item)
//                }
//            }
//        }
    }
}

#Preview {
    CollectionView(collection: .init(name: "Colecao Teste", isPrivate: false, image: nil))
}

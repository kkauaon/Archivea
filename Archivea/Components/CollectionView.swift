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
    
    @State var screenSizes = UIScreen.main.bounds.size
    
    var body: some View {
            VStack {
                if let data = collection.image, let image = UIImage(data: data) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: (screenSizes.width / 2) - 30, height: 130)
                        .cornerRadius(5)
                        .clipped()
                        .allowsHitTesting(false)
                } else {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.gray)
                        .frame(width: (screenSizes.width / 2) - 30, height: 130)
                        .overlay {
                            Image(systemName: "photo.badge.plus.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 48)
                        }
                }
                HStack{
                    Text(collection.name)
                        .foregroundColor(.black)
                    
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
            .sheet(isPresented: $isSheetPresented) {
                EditCollectionView(collection: collection)
            }
            .frame(width: (screenSizes.width / 2) - 30)
            
    }
}

//Aprendendo sobre grid com a Bia
struct TestView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let colors = [Color.red, Color.blue, Color.green, Color.yellow]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(colors, id: \.self) { color in
                ZStack {
                    color
                }
            }
        }
    }
}
//#Preview {
//    CollectionView(collection: .init(name: "Coleção Teste", isPrivate: false, image: nil))
//}

#Preview {
    TestView()
}

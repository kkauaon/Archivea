//
//  ItemCollectionView.swift
//  Archivea
//
//  Created by found on 13/02/25.
//

import SwiftUI

struct ItemCollectionView: View {
    
    @State var itemCollection : ItemCollection
    
    @State var isSheetPresented : Bool = false
    
    var body: some View {
        VStack {
            if let data = itemCollection.photo, let image = UIImage(data: data) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    //.frame(height: 250)
                    .cornerRadius(5)
                    .clipped()
                    .allowsHitTesting(false)
            } else {
                RoundedRectangle(cornerRadius: 5)
                    .fill(.gray)
                    .frame(height: 250)
                    .overlay {
                        Image(systemName: "photo.badge.plus.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 48)
                    }
            }
            HStack{
                Text(itemCollection.name)
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
            
            Text(itemCollection.desc)
            
            VStack(alignment: .leading){
                ForEach (itemCollection.fields){ field in
                    Text("\(field.fieldName):  \(field.fieldValue)")
                }
            }
        }
        .sheet(isPresented: $isSheetPresented) {
            //            EditItemCollectionView(itemCollection: itemCollection)
        }
    }
}

#Preview {
    ItemCollectionView(itemCollection: .init(name: "OiItem", desc: "OiItem", photo: nil, fields: [], collection: .init(name: "OiColeção")))
}

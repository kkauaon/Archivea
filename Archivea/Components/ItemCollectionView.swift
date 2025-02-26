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
    
    @State var editable : Bool = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let data = itemCollection.photo, let image = UIImage(data: data) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                
                //.frame(height: 250)
                    .cornerRadius(5)
                    .clipped()
                    //.allowsHitTesting(false)
                    .overlay(alignment: .topLeading){
                        if editable {
                            Button {
                                isSheetPresented = true
                            } label: {
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .padding(8)
                                    .foregroundColor(.black)
                                    .overlay(alignment: .topLeading) {
                                        Image(systemName: "square.and.pencil.circle.fill")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                            .foregroundColor(.white)
                                            .padding(8)
                                    }
                            }
                        }
                    }
            } else {
                RoundedRectangle(cornerRadius: 5)
                    .noPhotoOverlay()
                    .frame(height: 250)
                    .overlay(alignment: .topLeading){
                        if editable {
                            Button {
                                isSheetPresented = true
                            } label: {
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .padding(8)
                                    .foregroundColor(.black)
                                    .overlay(alignment: .topLeading) {
                                        Image(systemName: "square.and.pencil.circle.fill")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                            .foregroundColor(.white)
                                            .padding(8)
                                    }
                            }
                        }
                    }
                
            }
            HStack{
                Text(itemCollection.name)
                    .bold()
                //.font(.system(size: 17))
                    .foregroundColor(.black)
                
                Spacer()
            }
            
            if !itemCollection.desc.isEmpty {
                Text(itemCollection.desc)
            }
            
            if itemCollection.fields.count > 0 {
                VStack(alignment: .leading){
                    ForEach (itemCollection.fields){ field in
                        Text("\(field.fieldName):  \(field.fieldValue)")
                    }
                }
            }
            
            Text("Conservação: \(preservationToString(preservation: itemCollection.preservation))")
        }
        .sheet(isPresented: $isSheetPresented) {
            EditItemCollectionView(itemCollection: itemCollection)
        }
    }
}

#Preview {
    List {
        ItemCollectionView(itemCollection: postToItemCollection(post: fakePosts.randomElement()!))
    }
}

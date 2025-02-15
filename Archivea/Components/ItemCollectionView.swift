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
        VStack(alignment: .leading) {
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
                    .fill(.gray)
                    .frame(height: 250)
                    .overlay {
                        Image(systemName: "photo.badge.plus.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 48)
                    }
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
            
            Text(itemCollection.desc)
            
            VStack(alignment: .leading){
                ForEach (itemCollection.fields){ field in
                    Text("\(field.fieldName):  \(field.fieldValue)")
                }
            }
        }
        .sheet(isPresented: $isSheetPresented) {
            EditItemCollectionView(itemCollection: itemCollection)
        }
    }
}

#Preview {
    ItemCollectionView(itemCollection: postToItemCollection(post: fakePosts.randomElement()!))
}

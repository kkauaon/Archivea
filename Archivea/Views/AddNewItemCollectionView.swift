//
//  AddNewCollectionView.swift
//  Archivea
//
//  Created by found on 31/01/25.
//

import SwiftUI
import PhotosUI

struct AddNewItemCollectionView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    //Estrutura do ItemCollection
//    var name: String
//    var desc: String
//    var photo: Data?
//    var fields: [CustomField]
//    var collection : Collection
    
    //@State var collectionIsPrivate: Bool = false
    
    @State var name: String = ""
    
    @State var desc: String = ""
    
    @State var selectedPhoto: PhotosPickerItem?
    
    //@State var collection : Collection
    @State var itemCollection : ItemCollection
    
    @State var isAlertPresented : Bool = false
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 12) {
                //Imagem
                if let data = itemCollection.photo, let image = UIImage(data: data) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 130)
                        .clipped()
                        .cornerRadius(5)
                        .padding(.top, 10)
                } else {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.gray)
                        .frame(width: 170, height: 130)
                        .padding(.top, 10)
                        .overlay {
                            Image(systemName: "photo.badge.plus.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 48)
                        }
                }
                
                
                //Botão de adicionar capa
                if selectedPhoto != nil {
                        Button(role: .destructive) {
                            selectedPhoto = nil
                            itemCollection.photo = nil
                        }label:{
                            Label("Remover capa", systemImage: "play.fill")
                        }
                        .padding(.top, 5)
                        .labelStyle(.titleAndIcon)
                        .buttonStyle(.borderedProminent)
                        .controlSize(.small)
                    
                } else {
                    //Entender o PhotosPicker como um botão.
                    PhotosPicker(selection: $selectedPhoto, matching: .images, photoLibrary: .shared()) {
                            Label("Adicionar capa", systemImage: "plus.circle")
                    }
                    .padding(.top, 5)
                    .labelStyle(.titleAndIcon)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.small)
                    Text("💡Dica: Corte a imagem previamente para que ela fique melhor ajustada!")
                        .foregroundColor(.gray)
                        .font(.caption2)
                }
                
                
                HStack {
                    Text("Nome:")
                    Spacer()
                }
                
                TextField("Nome do item", text: $name)
                    .textFieldStyle(.roundedBorder)
                
                //COLOCAR AQUI O Picker DA preservation!!!
                
                HStack {
                    Text("Descrição:")
                    Spacer()
                }
                
                TextField("Descrição do item", text: $desc, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(5...10)
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .top
            )
            .padding(.horizontal, 40)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Adicionar item")
            .toolbar {
                Button {
                    if !name.isEmpty {
                        let newItem = ItemCollection(name: name, desc: desc, photo: itemCollection.photo, fields: [], collection: itemCollection.collection)
                        
                        modelContext.insert(newItem)
                        
                        name = ""
                        
                        dismiss()
                    }else{
                        isAlertPresented = true
                    }
                } label: {
                    Text("Salvar")
                        .bold()
                }
            }
        }
        //.padding(.horizontal, 32)
        //.presentationDragIndicator(.visible)
        //.presentationBackground(Color(hex: 0xE9E9E9, alpha: 0.97))
        .presentationDetents([.height(550), .large])
        .presentationCornerRadius(20)
        .task(id: selectedPhoto) {
            if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                itemCollection.photo = data
            }
        }
//        .alert(Text("Coloque um título na sua categoria!"), isPresented: $isAlertPresented) message: Text("Não é possível criar uma coleção sem nome. \n Para adicionar sua coleção, por favor, ponha um nome e tente novamente."))
        .alert(Text("Entitule o seu item de coleção."), isPresented: $isAlertPresented) {
            Button("Ok") {
                isAlertPresented = false
            }
        } message: {
            Text("Não é possível criar um item sem nome.\nPara adicionar seu item, por favor, ponha um nome e tente novamente.")
        }
        
        //Mostrar o Grab da sheet
        //AddNewCollectionView.prefersGrabberVisible = true
        
    }
}

#Preview {
    AddNewCollectionView()
}

//
//  AddNewCollectionView.swift
//  Archivea
//
//  Created by found on 31/01/25.
//

import SwiftUI
import PhotosUI

struct EditItemCollectionView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State var collectionIsPrivate: Bool = false
    
    @State var name: String = ""
    
    @State var desc: String = ""
    
    @State var selectedPhoto: PhotosPickerItem?
    
    @State var itemCollection : ItemCollection
    
    @State var imageData : Data?
    
    @State var isAlertPresented : Bool = false
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 12) {
                //Imagem
                if let data = imageData, let image = UIImage(data: data) {
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
                //Caso já haja uma capa da coleção.
                if imageData != nil {
                        Button(role: .destructive) {
                            selectedPhoto = nil
                            imageData = nil
                            //Aparece a opção de remover a capa.
                        }label:{
                            Label("Remover capa", systemImage: "play.fill")
                        }
                        .padding(.top, 5)
                        .labelStyle(.titleAndIcon)
                        .buttonStyle(.borderedProminent)
                        .controlSize(.small)
                //Caso não haja uma capa na coleção.
                } else {
                    //Entender o PhotosPicker como um botão.
                    PhotosPicker(selection: $selectedPhoto, matching: .images, photoLibrary: .shared()) {
                        //Aparece a opção de
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
                    Text("Nome")
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
                
                
                Button(role: .destructive){
                    modelContext.delete(itemCollection)
                }label:{
                    Label("Deletar Item", systemImage: "trash")
                }
                .buttonStyle(.borderedProminent)
                .cornerRadius(40)
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .top
            )
            .padding(.horizontal, 40)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Editar Item")
            .toolbar {
                Button {
                    if !name.isEmpty {
                        itemCollection.name = name
                        itemCollection.desc = desc
                        itemCollection.photo = imageData
                        
                        dismiss()
                    }
                    else{
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
        .onAppear {
            name = itemCollection.name
            desc = itemCollection.desc
            imageData = itemCollection.photo
        }
        .task(id: selectedPhoto) {
            if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                imageData = data
            }
        }
        .alert(Text("Entitule a sua coleção."), isPresented: $isAlertPresented) {
            Button("Ok") {
                isAlertPresented = false
            }
        } message: {
            Text("Não é possível criar uma coleção sem nome.\nPara adicionar sua coleção, por favor, ponha um nome e tente novamente.")
        }
    }
}

#Preview {
    EditItemCollectionView(itemCollection: .init(name: "Porsche 911", desc: "Edicao de 1999", photo: nil, fields: [], collection: .init(name: "Carrinhos HotWheels")))
}

//
//  AddNewCollectionView.swift
//  Archivea
//
//  Created by found on 31/01/25.
//

import SwiftUI
import PhotosUI

struct EditCollectionView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State var collectionIsPrivate: Bool = false
    
    @State var name: String = ""
    
    @State var selectedPhoto: PhotosPickerItem?
    
    @State var collection : Collection
    
    @State var imageData : Data?
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 12) {
                //Imagem
                if let data = imageData, let image = UIImage(data: data) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 170, height: 130)
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
                    Text("Título da coleção:")
                    Spacer()
                }
                
                TextField("Nome da coleção", text: $name)
                    .textFieldStyle(.roundedBorder)
                
                Toggle(isOn: $collectionIsPrivate){
                    Text("Privado")
                }
                Button(role: .destructive){
                    modelContext.delete(collection)
                }label:{
                    Label("Deletar coleção", systemImage: "trash")
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
            .navigationTitle("Editar Coleção")
            .toolbar {
                Button {
                    modelContext.delete(collection)
                    //Instanciando a coleção
                    let collection = Collection(name: name, isPrivate: collectionIsPrivate, image: imageData)
                    modelContext.insert(collection)
                    
                    dismiss()
                } label: {
                    Text("Salvar")
                        .bold()
                }
            }
        }
        //.padding(.horizontal, 32)
        //.presentationDragIndicator(.visible)
        //.presentationBackground(Color(hex: 0xE9E9E9, alpha: 0.97))
        .presentationDetents([.height(450), .large])
        .presentationCornerRadius(20)
        .onAppear {
            name = collection.name
            collectionIsPrivate = collection.isPrivate
            imageData = collection.image
        }
        .task(id: selectedPhoto) {
            if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                imageData = data
            }
        }
        
        //Mostrar o Grab da sheet
        //AddNewCollectionView.prefersGrabberVisible = true
        
    }
}

#Preview {
    AddNewCollectionView()
}

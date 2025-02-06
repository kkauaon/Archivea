//
//  AddNewCollectionView.swift
//  Archivea
//
//  Created by found on 31/01/25.
//

import SwiftUI
import PhotosUI

struct AddNewCollectionView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State var collectionIsPrivate: Bool = false
    
    @State var name: String = ""
    
    @State var selectedPhoto: PhotosPickerItem?
    
    @State var collection : Collection = .init(name: "")
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 12) {
                //Imagem
                if let data = collection.image, let image = UIImage(data: data) {
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
                }
                
                
                //Botão de adicionar capa
                if selectedPhoto != nil {
                        Button(role: .destructive) {
                            selectedPhoto = nil
                            collection.image = nil
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
                    Text("Título da coleção:")
                    Spacer()
                }
                
                TextField("Nome da coleção", text: $name)
                    .textFieldStyle(.roundedBorder)
                
                Toggle(isOn: $collectionIsPrivate){
                    Text("Privado")
                }
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .top
            )
            .padding(.horizontal, 40)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Adicionar coleção")
            .toolbar {
                Button {
                    //Instanciar a colecao - tirar a imagem sendo string e colocar Data
                    let collection = Collection(name: name, isPrivate: collectionIsPrivate, image: collection.image)
                    
                    modelContext.insert(collection)
                    
                    name = ""
                    
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
        .task(id: selectedPhoto) {
            if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                collection.image = data
            }
        }
        
        //Mostrar o Grab da sheet
        //AddNewCollectionView.prefersGrabberVisible = true
        
    }
}

#Preview {
    AddNewCollectionView()
}

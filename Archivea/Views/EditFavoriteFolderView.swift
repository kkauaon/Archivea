//
//  AddNewCollectionView.swift
//  Archivea
//
//  Created by found on 31/01/25.
//

import SwiftUI
import PhotosUI

struct EditFavoriteFolderView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State var name: String = ""
    
    @State var selectedPhoto: PhotosPickerItem?
    
    @State var folder : FavoriteFolder
    
    @State var imageData : Data?
    
    @State var isAlertPresented : Bool = false
    
    
    var body: some View {
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
                    .fill(Color(hex: 0xDFDFDF))
                    .frame(width: 170, height: 130)
                    .padding(.top, 10)
                    .overlay(alignment: .center) {
                        Image(systemName: "plus.square")
                            .resizable()
                            .foregroundStyle(Color(hex: 0x3C3C43, alpha: 0.29))
                            .frame(width: 60, height: 60)
                            .padding(.top, 10)
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
                    Label("Remover Imagem", systemImage: "play.fill")
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
                    Label("Adicionar Imagem", systemImage: "plus.circle")
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
                Text("Título:")
                Spacer()
            }
            
            TextField("Adicionar título", text: $name)
                .textFieldStyle(.roundedBorder)
            
            Button(role: .destructive){
                modelContext.delete(folder)
            }label:{
                Label("Deletar pasta", systemImage: "trash")
            }
            .buttonStyle(.borderedProminent)
            .cornerRadius(40)
        }
        .littleSheet(title: "Editar Pasta de Favoritos") {
            if !name.isEmpty {
                folder.name = name
                folder.image = imageData
                
                dismiss()
            }
            else{
                isAlertPresented = true
            }
        }
        .onAppear {
            name = folder.name
            imageData = folder.image
        }
        .task(id: selectedPhoto) {
            if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                imageData = data
            }
        }
        .alert(Text("Entitule a sua pasta de favoritos."), isPresented: $isAlertPresented) {
            Button("Ok") {
                isAlertPresented = false
            }
        } message: {
            Text("Não é possível criar uma pasta de favoritos sem nome.\nPara adicionar, por favor, ponha um nome e tente novamente.")
        }
    }
}

#Preview {
    EditFavoriteFolderView(folder: .init(name: "Carrinhos", author: previewMyProfile))
}

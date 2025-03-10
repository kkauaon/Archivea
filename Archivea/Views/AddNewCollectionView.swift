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
    
    @State var collection : Collection = .init(name: "", author: previewMyProfile)
    
    @State var profile: MyProfile
    
    @State var isAlertPresented : Bool = false
    
    
    var body: some View {
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
                    .noPhotoOverlay()
                    .frame(width: 170, height: 130)
                    .padding(.top, 10)
            }
            
            
            //Botão de adicionar capa
            if selectedPhoto != nil {
                Button(role: .destructive) {
                    selectedPhoto = nil
                    collection.image = nil
                }label:{
                    Label("Remover capa", systemImage: "trash")
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
        .littleSheet(title: "Adicionar Coleção") {
            if !name.isEmpty {
                let collection = Collection(name: name, isPrivate: collectionIsPrivate, image: collection.image, author: profile)
                
                modelContext.insert(collection)
                
                name = ""
                
                dismiss()
            }else{
                isAlertPresented = true
            }
        }
        
        .task(id: selectedPhoto) {
            if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                collection.image = data
            }
        }
        //        .alert(Text("Coloque um título na sua categoria!"), isPresented: $isAlertPresented) message: Text("Não é possível criar uma coleção sem nome. \n Para adicionar sua coleção, por favor, ponha um nome e tente novamente."))
        .simpleAlert(isPresented: $isAlertPresented, title: "Entitule a sua coleção.", text:  "Não é possível criar uma coleção sem nome.\nPara adicionar sua coleção, por favor, ponha um nome e tente novamente.")
        
        //Mostrar o Grab da sheet
        //AddNewCollectionView.prefersGrabberVisible = true
        
    }
}

#Preview {
    AddNewCollectionView(profile: previewMyProfile)
}

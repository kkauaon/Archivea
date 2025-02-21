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
                    if !name.isEmpty {
                        let collection = Collection(name: name, isPrivate: collectionIsPrivate, image: collection.image, author: profile)
                        
                        modelContext.insert(collection)
                        
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
        .presentationDetents([.height(450), .large])
        .presentationCornerRadius(20)
        .task(id: selectedPhoto) {
            if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                collection.image = data
            }
        }
//        .alert(Text("Coloque um título na sua categoria!"), isPresented: $isAlertPresented) message: Text("Não é possível criar uma coleção sem nome. \n Para adicionar sua coleção, por favor, ponha um nome e tente novamente."))
        .alert(Text("Entitule a sua coleção."), isPresented: $isAlertPresented) {
            Button("Ok") {
                isAlertPresented = false
            }
        } message: {
            Text("Não é possível criar uma coleção sem nome.\nPara adicionar sua coleção, por favor, ponha um nome e tente novamente.")
        }
        
        //Mostrar o Grab da sheet
        //AddNewCollectionView.prefersGrabberVisible = true
        
    }
}

#Preview {
    AddNewCollectionView(profile: previewMyProfile)
}

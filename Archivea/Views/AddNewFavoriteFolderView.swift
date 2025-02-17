//
//  AddNewCollectionView.swift
//  Archivea
//
//  Created by found on 31/01/25.
//

import SwiftUI
import PhotosUI

struct AddNewFavoriteFolderView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State var name: String = ""
    
    @State var selectedPhoto: PhotosPickerItem?
    
    @State var folder : FavoriteFolder = .init(name: "", image: nil)
    
    @State var isAlertPresented : Bool = false
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 12) {
                //Imagem
                if let data = folder.image, let image = UIImage(data: data) {
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
                            folder.image = nil
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
                
                TextField("Título", text: $name)
                    .textFieldStyle(.roundedBorder)
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .top
            )
            .padding(.horizontal, 40)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Adicionar Pasta de Favoritos")
            .toolbar {
                Button {
                    if !name.isEmpty {
                        let folder = FavoriteFolder(name: name, image: folder.image)
                        
                        modelContext.insert(folder)
                        
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
        //.presentationBackground(Color(hex: 0xE9E9E9, alpha: 0.97))
        .presentationDetents([.height(450), .large])
        .presentationCornerRadius(20)
        .task(id: selectedPhoto) {
            if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                folder.image = data
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
    AddNewFavoriteFolderView()
}

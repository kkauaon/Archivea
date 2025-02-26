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
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    @State var collectionIsPrivate: Bool = false
    
    @State var name: String = ""
    
    @State var desc: String = ""
    
    @State var selectedPhoto: PhotosPickerItem?
    
    @State var itemCollection : ItemCollection
    
    @State var imageData : Data?
    
    @State var isAlertPresented : Bool = false
    
    @State var preservation: Int = 5
    
    @State var customFields: [CustomField] = []
    
    
    var body: some View {
        ScrollView {
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
                        .noPhotoOverlay()
                        .frame(width: 170, height: 130)
                        .padding(.top, 10)
                }
                
                
                //Botão de adicionar capa
                //Caso já haja uma capa da coleção.
                if imageData != nil {
                    Button(role: .destructive) {
                        selectedPhoto = nil
                        imageData = nil
                        //Aparece a opção de remover a capa.
                    }label:{
                        Label("Remover capa", systemImage: "trash")
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
                    Text("Estado de Conservação:")
                    Spacer()
                }
                
                PreservationPicker(selection: $preservation)
                
                HStack {
                    Text("Descrição:")
                    Spacer()
                }
                
                TextField("Descrição do item", text: $desc, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(5...10)
                
                HStack{
                    Text("Características")
                    Spacer()
                    Button{
                        customFields.append(CustomField(fieldName: "", fieldValue: ""))
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.black)
                    }
                }
                
                List {
                    ForEach ($customFields) { field in
                        CustomFieldView(field: field)
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden)
                    }
                    .onDelete { indices in
                        customFields.remove(atOffsets: indices)
                    }
                }
                .frame(minHeight: minRowHeight * CGFloat(customFields.count))
                .listStyle(.plain)
                
                Button(role: .destructive){
                    modelContext.delete(itemCollection)
                }label:{
                    Label("Deletar Item", systemImage: "trash")
                }
                .buttonStyle(.borderedProminent)
                .cornerRadius(40)
            }
        }
        .littleSheet(height: PresentationDetent.large, title: "Editar Item") {
            if !name.isEmpty {
                customFields.removeAll(where: { $0.fieldName.isEmpty || $0.fieldValue.isEmpty })
                
                itemCollection.name = name
                itemCollection.desc = desc
                itemCollection.preservation = preservation
                itemCollection.photo = imageData
                itemCollection.fields = customFields
                
                dismiss()
            }
            else{
                isAlertPresented = true
            }
        }
        .onAppear {
            name = itemCollection.name
            desc = itemCollection.desc
            preservation = itemCollection.preservation
            imageData = itemCollection.photo
            customFields = itemCollection.fields
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
    EditItemCollectionView(itemCollection: .init(name: "Porsche 911", desc: "Ediçao limitada de 1999", preservation: 5, fields: [.init(fieldName: "Ano", fieldValue: "1999")], collection: .init(name: "Carrinhos HotWheels", author: previewMyProfile)))
}

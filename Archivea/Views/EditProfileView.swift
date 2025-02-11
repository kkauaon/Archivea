//
//  EditProfileView.swift
//  Archivea
//
//  Created by found on 07/02/25.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Binding var profile: MyProfile
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State var name: String = ""
    
    @State var handle: String = ""
    
    @State var selectedPhoto: PhotosPickerItem?
    
    @State var imageData : Data?
    
    
    var body: some View {
        ScrollView{
            NavigationView {
                VStack(alignment: .center, spacing: 12) {
                    //Imagem
                    
                    AvatarView(avatarData: imageData, avatarSize: .large)
                    
                    //Botão de adicionar capa
                    //Caso já haja uma capa da coleção.
                    if imageData != nil {
                        Button(role: .destructive) {
                            selectedPhoto = nil
                            imageData = nil
                            //Aparece a opção de remover a capa.
                        }label:{
                            Label("Remover foto", systemImage: "play.fill")
                        }
                        .labelStyle(.titleAndIcon)
                        .buttonStyle(.borderedProminent)
                        .controlSize(.small)
                        //Caso não haja uma capa na coleção.
                    } else {
                        //Entender o PhotosPicker como um botão.
                        PhotosPicker(selection: $selectedPhoto, matching: .images, photoLibrary: .shared()) {
                            //Aparece a opção de
                            Label("Adicionar foto", systemImage: "plus.circle")
                        }
                        .labelStyle(.titleAndIcon)
                        .buttonStyle(.borderedProminent)
                        .controlSize(.small)
                        //                    Text("💡Dica: Corte a imagem previamente para que ela fique melhor ajustada!")
                        //                        .foregroundColor(.gray)
                        //                        .font(.caption2)
                    }
                    
                    
                    HStack {
                        Text("Nome de usuário")
                        Spacer()
                    }
                    
                    TextField(profile.name, text: $name)
                        .textFieldStyle(.roundedBorder)
                    
                    HStack {
                        Text("Apelido")
                        Spacer()
                    }
                    
                    TextField(profile.handle, text: $handle)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                    
                    //                HStack {
                    //                    Text("E-mail")
                    //                    Spacer()
                    //                }
                    //
                    //                TextField(profile.name, text: $name)
                    //                    .textFieldStyle(.roundedBorder)
                    //
                    //                HStack {
                    //                    Text("Senha")
                    //                    Spacer()
                    //                }
                    //
                    //                SecureField(profile.name, text: $name)
                    //                    .textFieldStyle(.roundedBorder)
                    
                    Button {
                        profile.name = name
                        profile.avatar = imageData
                        profile.handle = handle
                        
                        dismiss()
                    } label: {
                        Text("Salvar alteraçoes")
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.extraLarge)
                    
                    
                    
                    //                Toggle(isOn: $collectionIsPrivate){
                    //                    Text("Privado")
                    //                }
                    //                Button(role: .destructive){
                    //                    modelContext.delete(collection)
                    //                }label:{
                    //                    Label("Deletar coleção", systemImage: "trash")
                    //                }
                    //                .buttonStyle(.borderedProminent)
                    //                .cornerRadius(40)
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .top
                )
                .padding(.horizontal, 40)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Editar Perfil")
            }
            //.padding(.horizontal, 32)
            //.presentationDragIndicator(.visible)
            //.presentationBackground(Color(hex: 0xE9E9E9, alpha: 0.97))
//            .presentationDetents([.height(500), .large])
//            .presentationCornerRadius(20)
            .onAppear {
                name = profile.name
                handle = profile.handle
                imageData = profile.avatar
            }
            .task(id: selectedPhoto) {
                if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                    imageData = data
                }
            }
        }
    }
}

#Preview {
    EditProfileView(profile: .constant(.init(name: "Kauã Sousa", handle: "kkauabr", bio: "entuasista", isWhatsappPublic: true, createdAt: .now, avatar: nil)))
}

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
    
    @State var bio: String = ""
    
    @State var selectedPhoto: PhotosPickerItem?
    
    @State var imageData : Data?
    
    @State var isWhatsappPublic: Bool = false
    
    @State var phone : String = ""
    
    var body: some View {
        
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
            
            
            HStack{
                Text("Biografia")
                Spacer()
            }
            
            TextField(profile.bio, text: $bio,  axis: .vertical)
                .lineLimit(5...10)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
            
            HStack{
                Text("Telefone")
                Spacer()
            }
            
            TextField(profile.phone, text: $phone)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
            
            Toggle("Whatsapp Público", isOn: $isWhatsappPublic)
            
            Button {
                profile.name = name
                profile.avatar = imageData
                profile.handle = handle
                profile.bio = bio
                profile.isWhatsappPublic = isWhatsappPublic
                profile.phone = phone
                
                dismiss()
            } label: {
                Text("Salvar alteraçoes")
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.extraLarge)
            
            Text("Conta criada em \(profile.createdAt.formatted())")
                .foregroundStyle(.secondary)
                .font(.caption)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .top
        )
        .padding(.horizontal, 40)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Editar Perfil")
        
        .onAppear {
            name = profile.name
            handle = profile.handle
            bio = profile.bio
            imageData = profile.avatar
            isWhatsappPublic = profile.isWhatsappPublic
            phone = profile.phone
        }
        .task(id: selectedPhoto) {
            if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                imageData = data
            }
        }
    }
    
}

#Preview {
    EditProfileView(profile: .constant(.init(name: "Kauã Sousa", handle: "kkauabr", bio: "entuasista", isWhatsappPublic: true, createdAt: .now, avatar: nil, phone: "85912345678")))
}

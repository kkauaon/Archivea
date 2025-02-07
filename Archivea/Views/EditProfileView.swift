//
//  EditProfileView.swift
//  Archivea
//
//  Created by found on 07/02/25.
//

import SwiftUI

struct EditProfileView: View {
    var profile: MyProfile
    var body: some View {
        NavigationStack{
            ScrollView{
                AvatarView(avatarData: profile.avatar)
                
            }
            .navigationTitle("Editar Perfil")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    EditProfileView(profile: .init(name: "Kauã Sousa", handle: "kkauabr", bio: "entuasista", isWhatsappPublic: true, createdAt: .now, avatar: nil))
}

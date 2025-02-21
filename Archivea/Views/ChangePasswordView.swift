//
//  ChangePasswordView.swift
//  Archivea
//
//  Created by found on 21/02/25.
//

import SwiftUI
import SwiftData

struct ChangePasswordView: View {
    @Environment(\.dismiss) var dismiss
    
    @Query var profiles : [MyProfile]
    
    @State var profile: MyProfile
    @State var password: String = ""
    
    var body: some View {
        VStack{
            SecureField("Nova senha", text: $password)
                .textFieldStyle(.roundedBorder)
        }
        .onAppear{
            if let profile = profiles.first(where: { $0.isLogged }) {
                self.profile = profile
            }
        }
        .littleSheet(height: 250, title: "Alteração de Senha") {
            profile.password = password
            dismiss()
        }
    }
}

#Preview {
    ChangePasswordView(profile: previewMyProfile)
}

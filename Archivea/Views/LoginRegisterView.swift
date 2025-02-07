//
//  LoginRegisterView.swift
//  Archivea
//
//  Created by iredefbmac_33 on 25/01/25.
//

import SwiftUI

struct LoginRegisterView: View {

    @State var isSignUp:Bool = false
    
    @State var username:String = ""
    @State var email:String = ""
    @State var password:String = ""
    
    var body: some View {
        VStack(spacing: 10) { // <-- verificar no figma
            Text(isSignUp ? "Primeiro Acesso" : "Conecte-se")
            
            TextField("Apelido", text: $username)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
            
            if isSignUp {
                TextField("E-mail", text: $email)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .textFieldStyle(.roundedBorder)
            }
            
            SecureField("Senha", text: $password)
                .textFieldStyle(.roundedBorder)
            
            Button {
                
            } label: {
                Text("Entrar")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            //.controlSize(.large)
            
            
            Picker("Sign In or Sign Up?", selection: $isSignUp) {
                Text("Sign In").tag(false)
                Text("Sign Up").tag(true)
            }
            .pickerStyle(.segmented)
            .frame(width: 250) // <-- verificar no figma
            .onChange(of: isSignUp) {
                username = ""
                email = ""
                password = ""
            }
        }
        .padding(.horizontal, 30) // <-- verificar no figma
    }
}

#Preview {

        LoginRegisterView()

}


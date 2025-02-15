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
    @State var name:String = ""
    
    @Binding var isLogged:Bool
    
    var body: some View {
        ZStack {
            Color.backgroundPrimary.ignoresSafeArea()
            
            VStack(spacing: 16) { // <-- verificar no figma
                Text(isSignUp ? "Primeiro Acesso" : "Conecte-se")
                    .foregroundStyle(.accent2)
                    .font(.system(size: 40))
                
                if isSignUp {
                    TextField("Nome", text: $name)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .cornerRadius(8)
                }
                
                TextField("Apelido", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .cornerRadius(8)
                
                if isSignUp {
                    TextField("E-mail", text: $email)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .textFieldStyle(.roundedBorder)
                        .cornerRadius(8)
                }
                
                SecureField("Senha", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .cornerRadius(8)
                
                Button {
                    withAnimation {
                        isLogged = true
                    }
                } label: {
                    Text("Entrar")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .tint(.accent2)
                .cornerRadius(16)
                .bold()
                
                
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
            .padding(.horizontal, 40) // <-- verificar no figma
        }
    }
}

#Preview {

    LoginRegisterView(isLogged: .constant(false))

}


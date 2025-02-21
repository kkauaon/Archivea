//
//  LoginRegisterView.swift
//  Archivea
//
//  Created by iredefbmac_33 on 25/01/25.
//

import SwiftUI
import SwiftData

struct LoginRegisterView: View {

    @Environment(\.modelContext) var modelContext
    
    @Query var profiles: [MyProfile]
    
    @State var isSignUp:Bool = false
    
    @State var username:String = ""
    @State var email:String = ""
    @State var password:String = ""
    @State var name:String = ""
    
    // Alertas
    @State var fieldsEmpty: Bool = false
    @State var wrongPassword: Bool = false
    @State var takenUsername: Bool = false
    @State var takenEmail: Bool = false
    @State var notFoundProfile: Bool = false
    
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
                        if isSignUp {
                            if !name.isEmpty, !username.isEmpty, !email.isEmpty, !password.isEmpty {
                                if profiles.first(where: { $0.email == email }) != nil {
                                    takenEmail = true
                                } else {
                                    if profiles.first(where: { $0.handle == username }) != nil {
                                        takenUsername = true
                                    } else {
                                        modelContext.insert(MyProfile(name: name, handle: username, isWhatsappPublic: false, createdAt: .now, phone: "", password: password, email: email, isLogged: true))
                                    }
                                }
                            } else {
                                fieldsEmpty = true
                            }
                        } else {
                            if !username.isEmpty, !password.isEmpty {
                                if let profile = profiles.first(where: { $0.handle == username }) {
                                    if profile.password == password {
                                        // Deslogando de todos os perfis, se ainda estiverem logados, caso extremamente raro.
                                        for p in profiles {
                                            if p.isLogged {
                                                p.isLogged = false
                                            }
                                        }
                                        
                                        profile.isLogged = true
                                    } else {
                                        wrongPassword = true
                                    }
                                } else {
                                    notFoundProfile = true
                                }
                            } else {
                                fieldsEmpty = true
                            }
                        }
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
            .simpleAlert(isPresented: $fieldsEmpty, title: "Erro", text: "Preencha todos os campos corretamente.")
            .simpleAlert(isPresented: $wrongPassword, title: "Erro", text: "Senha incorreta.")
            .simpleAlert(isPresented: $takenEmail, title: "Erro", text: "Este e-mail já está associado a uma conta.")
            .simpleAlert(isPresented: $takenUsername, title: "Erro", text: "Este nome de usuário já está em uso.")
            .simpleAlert(isPresented: $notFoundProfile, title: "Erro", text: "Usuário inexistente.")
            .padding(.horizontal, 40) // <-- verificar no figma
        }
    }
}

#Preview {

    LoginRegisterView()
        .modelContainer(for: MyProfile.self)

}


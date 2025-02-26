import SwiftUI
import SwiftData

struct ConfigView: View {
    
    @Environment(\.modelContext) var modelContext
    @EnvironmentObject private var loginManager: LoginManager
    
    @Query var profiles: [MyProfile]
    
    @State var isChangePasswordSheetPresented = false
    
    @State var isLogoutAlertPresented = false
    
    @State var profile: MyProfile
    
    var body: some View {
        List {
            Section(header: Text("Perfil")) {
                Button {
                    isChangePasswordSheetPresented = true
                } label: {
                    Text("Alterar Senha")
                }
                .buttonStyle(.plain)
                .sheet(isPresented: $isChangePasswordSheetPresented) {
                    ChangePasswordView(profile: profile)
                }
                
                Button(role: .destructive){
                    isLogoutAlertPresented = true
                } label: {
                    Text("Encerrar Sessão")
                }
                .buttonStyle(.borderless)
                .alert("Desconectar-se", isPresented: $isLogoutAlertPresented) {
                    Button("Encerrar Sessão", role: .destructive) {
                        if let profile = loginManager.profile {
                            withAnimation {
                                profile.isLogged = false
                                loginManager.logout()
                            }
                        }
                    }
                    Button("Cancelar", role: .cancel) {
                        isLogoutAlertPresented = false
                    }
                } message: {
                    Text("Tens certeza de que irás desconectar? \nNão se esqueça de seu nome de utilizador e senha!")
                }
                
            }
            Section(header: Text("Aparência")) {
                Toggle("Fundo do Feed Animado", isOn: $profile.isFeedBackgroundAnimated)
            }
            
//            Section(header: Text("Notificações")) {
//                ForEach(notificationButtons, id: \.self) { name in
//                    NavigationLink(destination: FeatureFuturaView()) {
//                        Text(name)
//                    }
//                    .buttonStyle(.borderless)
//                }
//            }
//            
//            Section(header: Text("Integrações")) {
//                ForEach(accountButtons, id: \.self) { name in
//                    NavigationLink(destination: FeatureFuturaView()) {
//                        Text(name)
//                    }
//                    .buttonStyle(.borderless)
//                }
//            }
//            
//            Section(header: Text("Aparência")) {
//                ForEach(appearanceButtons, id: \.self) { name in
//                    NavigationLink(destination: FeatureFuturaView()) {
//                        Text(name)
//                    }
//                    .buttonStyle(.borderless)
//                }
//            }
//            
//            Section(header: Text("Privacidade e Segurança")) {
//                ForEach(privacyButtons, id: \.self) { name in
//                    NavigationLink(destination: FeatureFuturaView()) {
//                        Text(name)
//                    }
//                    .buttonStyle(.borderless)
//                }
//            }
//            
//            Section(header: Text("Sincronização e Armazenamento")) {
//                ForEach(storageButtons, id: \.self) { name in
//                    NavigationLink(destination: FeatureFuturaView()) {
//                        Text(name)
//                    }
//                    .buttonStyle(.borderless)
//                }
//            }
//            
//            Section(header: Text("Atualizações")) {
//                ForEach(updateButtons, id: \.self) { name in
//                    NavigationLink(destination: FeatureFuturaView()) {
//                        Text(name)
//                    }
//                    .buttonStyle(.borderless)
//                }
//            }
//            
//            Section(header: Text("Suporte")) {
//                ForEach(supportButtons, id: \.self) { name in
//                    NavigationLink(destination: FeatureFuturaView()) {
//                        Text(name)
//                    }
//                    .buttonStyle(.borderless)
//                }
//            }
        }
        .navigationTitle("Configurações")
        .onAppear {
            if let profile = profiles.first(where: { $0.isLogged }) {
                self.profile = profile
            }
        }
    }
}
#Preview {
    NavigationStack {
        ConfigView(profile: previewMyProfile)
    }
}

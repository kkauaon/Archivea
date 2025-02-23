import SwiftUI
import SwiftData

struct ConfigView: View {
    
    @Environment(\.modelContext) var modelContext
    @EnvironmentObject private var loginManager: LoginManager
    
    @Query var profiles: [MyProfile]
    
    @State var isChangePasswordSheetPresented = false
    
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
                    if let profile = loginManager.profile {
                        withAnimation {
                            profile.isLogged = false
                            loginManager.logout()
                        }
                    }
                } label: {
                    Text("Encerrar Sessão")
                }
                .buttonStyle(.borderless)
                
            }
            
            Section(header: Text("Notificações")) {
                ForEach(notificationButtons, id: \.self) { name in
                    NavigationLink(destination: FeatureFuturaView()) {
                        Text(name)
                    }
                    .buttonStyle(.borderless)
                }
            }
            
            Section(header: Text("Integrações")) {
                ForEach(accountButtons, id: \.self) { name in
                    NavigationLink(destination: FeatureFuturaView()) {
                        Text(name)
                    }
                    .buttonStyle(.borderless)
                }
            }
            
            Section(header: Text("Aparência")) {
                ForEach(appearanceButtons, id: \.self) { name in
                    NavigationLink(destination: FeatureFuturaView()) {
                        Text(name)
                    }
                    .buttonStyle(.borderless)
                }
            }
            
            Section(header: Text("Privacidade e Segurança")) {
                ForEach(privacyButtons, id: \.self) { name in
                    NavigationLink(destination: FeatureFuturaView()) {
                        Text(name)
                    }
                    .buttonStyle(.borderless)
                }
            }
            
            Section(header: Text("Sincronização e Armazenamento")) {
                ForEach(storageButtons, id: \.self) { name in
                    NavigationLink(destination: FeatureFuturaView()) {
                        Text(name)
                    }
                    .buttonStyle(.borderless)
                }
            }
            
            Section(header: Text("Atualizações")) {
                ForEach(updateButtons, id: \.self) { name in
                    NavigationLink(destination: FeatureFuturaView()) {
                        Text(name)
                    }
                    .buttonStyle(.borderless)
                }
            }
            
            Section(header: Text("Suporte")) {
                ForEach(supportButtons, id: \.self) { name in
                    NavigationLink(destination: FeatureFuturaView()) {
                        Text(name)
                    }
                    .buttonStyle(.borderless)
                }
            }
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

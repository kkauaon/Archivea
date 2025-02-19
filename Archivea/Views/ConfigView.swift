import SwiftUI
import SwiftData

struct ConfigView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var profiles: [MyProfile]
    
    var body: some View {
        List {
            
            
            Section(header: Text("Perfil")) {
                ForEach(profileButtons, id: \.self) { name in
                    if !name.contains("Encerrar Sessão") {
                        NavigationLink(destination: FeatureFuturaView()) {
                            Text(name)
                        }
                        .buttonStyle(.borderless)
                    }else{
                        Button(role: .destructive){
                            if let profile = profiles.first {
                                withAnimation {
                                    modelContext.delete(profile)
                                }
                            }
                        } label: {
                            Text(name)
                        }
                        .buttonStyle(.borderless)
                    }
                }
            }
            
            Section(header: Text("Notificações")) {
                ForEach(notificationButtons, id: \.self) { name in
                    NavigationLink(destination: FeatureFuturaView()) {
                        Text(name)
                    }
                    .buttonStyle(.borderless)
                }
            }
            
            Section(header: Text("Contas")) {
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
        
    }
}
#Preview {
    NavigationStack {
        ConfigView()
    }
}

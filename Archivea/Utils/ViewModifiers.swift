import Foundation
import SwiftUI

struct LittleSheet: ViewModifier {
    var title: String
    var saveAction: () -> Void
    
    func body(content: Content) -> some View {
            content
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .top
                )
                .padding(.horizontal, 40)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle(title)
                .toolbar {
                    Button {
                        saveAction()
                    } label: {
                        Text("Salvar")
                            .bold()
                    }
                }
                .scrollIndicators(.hidden)
            }
            //.padding(.horizontal, 32)
            //.presentationDragIndicator(.visible)
            //.presentationBackground(Color(hex: 0xE9E9E9, alpha: 0.97))
            
        
}

extension View {
    // Criando o modifier .littleSheet
    // O que permite customizar? Altura da sheet, o título dela e ação de quando clicar em "Salvar"
    func littleSheet(height: CGFloat = 450, title: String, saveAction: @escaping () -> Void) -> some View {
        NavigationView {
            modifier(LittleSheet(title: title, saveAction: saveAction))
        }
        .presentationDetents([.height(height), .large])
        .presentationCornerRadius(20)
    }
    
    func littleSheet(height: PresentationDetent, title: String, saveAction: @escaping () -> Void) -> some View {
        NavigationView {
            modifier(LittleSheet(title: title, saveAction: saveAction))
        }
        .presentationDetents([height, .large])
        .presentationCornerRadius(20)
    }
    
    // Alerta simplificado, vem com botão "Ok" com ação já feita. Basta usar .simpleAlert(isPresented, title: "Alerta", text: "Mensagem")
    func simpleAlert(isPresented: Binding<Bool>, title: String, text: String) -> some View {
        self.alert(title, isPresented: isPresented, actions: {
            Button("Ok") {
                isPresented.wrappedValue = false
            }
        }, message: {
            Text(text)
        })
    }
}

//SFProRounded
struct RoundedFont: ViewModifier {
    let size: CGFloat
    
    init(size: CGFloat? = nil) {
        self.size = size ?? 17 // Tamanho padrão do sistema se não for especificado!!
    }
    
    func body(content: Content) -> some View {
        content
            .font(.custom("SF Pro Rounded", size: size))
    }
}

extension View {
    func roundedFont(size: CGFloat? = nil) -> some View {
        modifier(RoundedFont(size: size))
    }
}

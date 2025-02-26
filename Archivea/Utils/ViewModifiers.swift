import Foundation
import SwiftUI

struct LittleSheet: ViewModifier {
    var title: String
    var toolbarText: String
    var padding: CGFloat
    var saveAction: () -> Void
    
    func body(content: Content) -> some View {
            content
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .top
                )
                .padding(.horizontal, padding)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle(title)
                .toolbar {
                    if !toolbarText.isEmpty {
                        Button {
                            saveAction()
                        } label: {
                            Text(toolbarText)
                                .bold()
                        }
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
    func littleSheet(height: CGFloat = 450, title: String, toolbarText: String = "Salvar", padding: CGFloat = 40, saveAction: @escaping () -> Void) -> some View {
        NavigationView {
            modifier(LittleSheet(title: title, toolbarText: toolbarText, padding: padding, saveAction: saveAction))
        }
        .presentationDetents([.height(height), .large])
        .presentationCornerRadius(20)
    }
    
    func littleSheet(height: PresentationDetent, title: String, toolbarText: String = "Salvar", padding: CGFloat = 40, saveAction: @escaping () -> Void) -> some View {
        NavigationView {
            modifier(LittleSheet(title: title, toolbarText: toolbarText, padding: padding, saveAction: saveAction))
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
    
    func roundedFont(size: CGFloat? = nil) -> some View {
        modifier(RoundedFont(size: size))
    }
}

extension RoundedRectangle {
    func noPhotoOverlay(topPadding: CGFloat = 5.0, size: CGFloat = 60.0) -> some View {
        self
            .fill(Color(hex: 0xDFDFDF))
            .overlay(alignment: .center) {
                Image(systemName: "plus.square")
                    .resizable()
                    .foregroundStyle(Color(hex: 0x3C3C43, alpha: 0.29))
                    .frame(width: size, height: size)
                    .padding(.top, topPadding)
            }
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

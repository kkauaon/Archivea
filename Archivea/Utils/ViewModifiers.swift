import Foundation
import SwiftUI

struct LittleSheet: ViewModifier {
    var title: String
    var sheetHeight: CGFloat
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
            }
            //.padding(.horizontal, 32)
            //.presentationDragIndicator(.visible)
            //.presentationBackground(Color(hex: 0xE9E9E9, alpha: 0.97))
            
        
}

extension View {
    func littleSheet(height: CGFloat = 450, title: String, saveAction: @escaping () -> Void) -> some View {
        NavigationView {
            modifier(LittleSheet(title: title, sheetHeight: height, saveAction: saveAction))
        }
        .presentationDetents([.height(height), .large])
        .presentationCornerRadius(20)
    }
    
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

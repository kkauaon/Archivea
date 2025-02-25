//
//  PreservationPicker.swift
//  Archivea
//
//  Created by iredefbmac_33 on 17/02/25.
//

import SwiftUI

struct PreservationPicker: View {
    
    @Binding var selection: Int
    
    @State private var showingPicker = false
    
    var body: some View {
        Button {
            showingPicker = true
        } label: {
            HStack {
                Text(preservationToString(preservation: selection))
                Spacer()
                //            Menu {
                //                Picker("Estado de Conservação", selection: $selection) {
                //                    Text("Péssimo").tag(1)
                //                    Text("Ruim").tag(2)
                //                    Text("Regular").tag(3)
                //                    Text("Bom").tag(4)
                //                    Text("Excelente").tag(5)
                //                }
                //            } label: {
                Image(systemName: "chevron.down")
                //            }
                //            .buttonStyle(.plain)
                
                
            }
            .contentShape(Rectangle())
        }
        .padding(8)
        .background(
            // Aplicamos uma borda a este HStack, tentei achar a cor mais próxima do que é a borda de um TextField.
            RoundedRectangle(cornerRadius: 5)
                .stroke(
                    Color(UIColor.separator).opacity(0.7),
                    lineWidth: 0.5
                )
        )
        .buttonStyle(.plain)
        .confirmationDialog("Estado de Conservação", isPresented: $showingPicker) {
                   Button("Péssimo") { selection = 1 }
                   Button("Ruim") { selection = 2 }
                   Button("Regular") { selection = 3 }
                   Button("Bom") { selection = 4 }
                   Button("Excelente") { selection = 5 }
               } message: {
                   Text("Selecione o Estado de Conservação")
                       .bold()
               }
    }
}

#Preview {
    @Previewable @State var preservation: Int = 5
    
    PreservationPicker(selection: $preservation)
}

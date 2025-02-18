//
//  PreservationPicker.swift
//  Archivea
//
//  Created by iredefbmac_33 on 17/02/25.
//

import SwiftUI

struct PreservationPicker: View {
    
    @Binding var selection: Int
    
    var body: some View {
        Menu {
            Picker("Estado de Conservação", selection: $selection) {
                Text("Péssimo").tag(1)
                Text("Ruim").tag(2)
                Text("Regular").tag(3)
                Text("Bom").tag(4)
                Text("Excelente").tag(5)
            }
        } label: {
            HStack {
                Text(preservationToString(preservation: selection))
                Spacer()
                Image(systemName: "chevron.down")
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
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    @Previewable @State var preservation: Int = 5
    
    PreservationPicker(selection: $preservation)
}

//
//  CustomFieldView.swift
//  Archivea
//
//  Created by iredefbmac_33 on 22/02/25.
//

import SwiftUI

struct CustomFieldView: View {
    
    @Binding var field: CustomField
    
    var body: some View {
        HStack {
            TextField("Atributo do item", text: $field.fieldName)
            TextField("Descrição do atributo", text: $field.fieldValue)
        }
        .textFieldStyle(.roundedBorder)
    }
}

#Preview {
    @Previewable @State var previewField = CustomField(fieldName: "", fieldValue: "")
    
    CustomFieldView(field: $previewField)
}

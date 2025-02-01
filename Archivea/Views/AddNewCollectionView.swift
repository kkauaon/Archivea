//
//  AddNewCollectionView.swift
//  Archivea
//
//  Created by found on 31/01/25.
//

import SwiftUI

struct AddNewCollectionView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State var name: String = ""
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(alignment: .leading){
                Text("Adicionar uma nova coleção")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 16)
                Text("Digite o nome da coleção:")
                TextField("Nome...                       ", text: $name)
                    .textFieldStyle(.roundedBorder)
                Button{
                    let collection = Collection(name: name)
                    
                    modelContext.insert(collection)
                    
                    name = ""
                    
                    dismiss()
                }label:{
                    Text("Salvar")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding(.horizontal, 32)
        .presentationDetents([.height(256)])
    }
}

#Preview {
    AddNewCollectionView()
}

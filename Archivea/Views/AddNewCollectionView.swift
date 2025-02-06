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
    
    @State var collectionIsPrivate: Bool = false
    
    @State var name: String = ""
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 12) {
                //Falta centralizar esse título (Adicionar coleção)
                //                Text("Adicionar coleção")
                //                    .font(.title2)
                //                    .bold()
                //                    .padding(.bottom, 16)
                
                //Imagem
                RoundedRectangle(cornerRadius: 5)
                    .fill(.gray)
                    .frame(width: 170, height: 130)
                    .padding(.top, 10)
                //Botão de adicionar capa
                Button{
                    //Fazer abrir a galeria do celular
                    //Escolher foto
                    
                    //Alterar imagem, do retângulo cinza para a imagem escolhida
                    
                    //Mudar a label desse botão para:
                    
                    //                    Button("Remover capa", systemImage: "play.fill", action: action)
                    //                    .labelStyle(.titleAndIcon)
                    //                    .buttonStyle(.borderedProminent)
                    //                    .controlSize(.small)
                    
                }label:{
                    Label("Adicionar capa", systemImage: "plus.circle")
                }
                .padding(.top, 5)
                .labelStyle(.titleAndIcon)
                .buttonStyle(.borderedProminent)
                .controlSize(.small)
                
                
                HStack {
                    Text("Título da coleção:")
                    Spacer()
                }
                
                TextField("Nome da coleção", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .background(Color.clear)
                
                Toggle(isOn: $collectionIsPrivate){
                    Text("Privado")
                }
                
                //Botão de salvar
//                Button{
//                    //Instanciar a colecao - tirar a imagem sendo string e colocar Data
//                    let collection = Collection(name: name, isPrivate: collectionIsPrivate, image: nil)
//                    
//                    modelContext.insert(collection)
//                    
//                    name = ""
//                    
//                    dismiss()
//                }label:{
//                    Text("Salvar")
//                        .frame(maxWidth: .infinity)
//                }
//                .buttonStyle(.borderedProminent)
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .top
            )
            .padding(.horizontal, 40)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Adicionar coleção")
            .toolbar {
                Button {
                    //Instanciar a colecao - tirar a imagem sendo string e colocar Data
                    let collection = Collection(name: name, isPrivate: collectionIsPrivate, image: nil)
                    
                    modelContext.insert(collection)
                    
                    name = ""
                    
                    dismiss()
                } label: {
                    Text("Salvar")
                        .bold()
                }
            }
        }
        //.padding(.horizontal, 32)
        //.presentationDragIndicator(.visible)
        //.presentationBackground(Color(hex: 0xE9E9E9, alpha: 0.97))
        .presentationDetents([.height(450), .large])
        .presentationCornerRadius(20)
        
        
        //Mostrar o Grab da sheet
        //AddNewCollectionView.prefersGrabberVisible = true
        
    }
}

#Preview {
    AddNewCollectionView()
}

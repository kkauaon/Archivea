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
    
    @State var collectionIsPrivate: Bool
    
    @State var name: String = ""
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(alignment: .leading){
                //Falta centralizar esse título (Adicionar coleção)
                Text("Adicionar coleção")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 16)
                
                //Imagem
                RoundedRectangle(cornerRadius: 5)
                    .fill(.gray)
                    .frame(width: 170, height: 130)
                    
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
                
                .labelStyle(.titleAndIcon)
                .buttonStyle(.borderedProminent)
                .controlSize(.small)
                    
                
                Text("Título da coleção:")
                ZStack{
                    TextField("Nome da coleção", text: $name)
                        .textFieldStyle(.roundedBorder)
                        .background(Color.clear)
                }
                
                Toggle(isOn: $collectionIsPrivate){
                    Text("Privado")
                }
                
                //Botão de salvar
                Button{
                    //Instanciar a colecao - tirar a imagem sendo string e colocar Data
                    let collection = Collection(name: name, isPrivate: collectionIsPrivate, image: "cachorro")
                    
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
        .presentationDetents([.height(400)])
        
        //Mostrar o Grab da sheet
        //AddNewCollectionView.prefersGrabberVisible = true
        
    }
}

#Preview {
    AddNewCollectionView()
}

//
//  PostView.swift
//  Archivea
//
//  Created by found on 27/01/25.
//

import SwiftUI

struct PostView: View {
    @State var post : Post
    var body: some View {
        VStack{
            Image(post.photo)
                            .resizable()
                            .cornerRadius(8)
                            .scaledToFit()
        }
    }
}

#Preview {
    PostView(post: .init(name: "camera cybershot dsc-w620", desc: "eu ganhei essa câmera de aniversário de 17 anos, da minha tia Claudia. amei!", photo: "cybershot", fields: [.init(fieldName: "ano", fieldValue: "2019")]))
}

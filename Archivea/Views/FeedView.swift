//
//  FeedView.swift
//  Archivea
//
//  Created by found on 27/01/25.
//

import SwiftUI

struct FeedView: View {
    
    @State var fakePost : [Post] = [.init(name: "camera cybershot dsc-w620", desc: "eu ganhei essa câmera de aniversário de 17 anos, da minha tia Claudia. amei!", photo: "cybershot", fields: [.init(fieldName: "ano", fieldValue: "2019")]), .init(name: "mewtwo ex edicao limitada", desc: "essa carta era do booster x&y, nao vende mais, comprado na Nao-Binaria", photo: "carta", fields: [.init(fieldName: "Região", fieldValue: "Unova")]), .init(name: "manga do haikyuu!!", desc: "manga que ganhei de natal em 18/12/1959", photo: "manga", fields: [.init(fieldName: "data", fieldValue: "18/12/1959")])]
    
    var body: some View {
        Grid(horizontalSpacing: 20, verticalSpacing: 20) {
            GridRow {
                ForEach (fakePost, id: \.self.photo) { post in
                    if fakePost.firstIndex(where: { $0.photo == post.photo})! % 2 == 0 {
                        PostView(post: post)
                        
                            
                    }
                }
            }
            GridRow {
                ForEach (fakePost, id: \.self.photo) { post in
                    if fakePost.firstIndex(where: { $0.photo == post.photo})! % 2 != 0 {
                        PostView(post: post)
                    }
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    FeedView()
}

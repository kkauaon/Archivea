//
//  FeedView.swift
//  Archivea
//
//  Created by found on 27/01/25.
//

import SwiftUI

struct FeedView: View {
    @State var search: String = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack(alignment: .top, spacing: 25) {
                    LazyVStack {
                        ForEach (fakePosts.indices, id: \.self) { position in
                            if position % 2 == 0 {
                                NavigationLink(destination: PostExtendedView(post: fakePosts[position])){
                                    PostView(post: fakePosts[position])
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                    LazyVStack {
                        ForEach (fakePosts.indices, id: \.self) { position in
                            if position % 2 != 0 {
                                NavigationLink(destination: PostExtendedView(post: fakePosts[position])){
                                    PostView(post: fakePosts[position])
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                }
            }
            .scrollIndicators(.never)
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .top
            )
            .padding(.horizontal, 16)
            .navigationTitle("Feed")
        }
        .searchable(text: $search, placement: .navigationBarDrawer(displayMode: .always), prompt: "Pesquise por um item...")
        .background(Color("backgroundFeedColor"))
    }
}

#Preview {
    FeedView()
}

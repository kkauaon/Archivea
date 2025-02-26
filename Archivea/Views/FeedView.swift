//
//  FeedView.swift
//  Archivea
//
//  Created by found on 27/01/25.
//

import SwiftUI

struct FeedView: View {
    @Namespace private var animation
    
    @State var search: String = ""
    
    @State var posts: [Post] = []
    
    @State var profile: MyProfile
    
    var body: some View {
        NavigationStack {
            ZStack{
                if profile.isFeedBackgroundAnimated{
                    BouncyBackground()
                }
                ScrollView {
                    HStack(alignment: .top, spacing: 25) {
                        LazyVStack {
                            ForEach (posts) { post in
                                if let position = posts.firstIndex(where: { $0.id == post.id }), position % 2 == 0 {
                                    NavigationLink { PostExtendedView(post: post)
                                            .navigationTransition(.zoom(sourceID: "zoom-\(post.id)", in: animation))
                                    } label: {
                                        PostView(post: post)
                                            .matchedTransitionSource(id: "zoom-\(post.id)", in: animation)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                        }
                        LazyVStack {
                            ForEach (posts) { post in
                                if let position = posts.firstIndex(where: { $0.id == post.id }), position % 2 != 0 {
                                    NavigationLink { PostExtendedView(post: post)
                                            .navigationTransition(.zoom(sourceID: "zoom-\(post.id)", in: animation))
                                    } label: {
                                        PostView(post: post)
                                            .matchedTransitionSource(id: "zoom-\(post.id)", in: animation)
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
            
        }
        .onAppear {
            posts = fakePosts
        }
        .onChange(of: search) {
            if search.isEmpty {
                posts = fakePosts
            } else {
                posts = fakePosts.filter {
                    $0.name.lowercased().contains(search.lowercased()) ||
                    $0.desc.lowercased().contains(search.lowercased()) ||
                    $0.author.handle.lowercased().contains(search.lowercased()) ||
                    $0.author.name.lowercased().contains(search.lowercased())
                }
                
                print("Resultados da pesquisa: ")
                for p in posts {
                    print("--> \(p.name)")
                }
            }
        }
        .searchable(text: $search, placement: .navigationBarDrawer(displayMode: .always), prompt: "Pesquise por um item...")
        .background(Color("backgroundFeedColor"))
    }
}

#Preview {
    FeedView(profile: previewMyProfile)
}

import SwiftUI
import SwiftData

struct FavoritesView: View {
    
    @Query(sort: \FavoriteFolder.name, order: .forward) var allFolders: [FavoriteFolder]
    
    @State var folders: [FavoriteFolder] = []
    
    @State var profile: MyProfile
    
    @State var addNewFavoriteFolderIsPresented : Bool = false
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack(spacing: 20) {
                    if folders.isEmpty{
                        Image("noFavoriteFolders")
                    } else{
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())] ){
                            ForEach (folders){ folder in
                                NavigationLink {
                                    FavoriteFolderExtendedView(folder: folder)
                                } label: {
                                    FavoriteFolderView(folder: folder)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                }
            }
            .scrollIndicators(.never)
            .padding(.horizontal, 16)
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .top
            )
            .sheet(isPresented: $addNewFavoriteFolderIsPresented) {
                AddNewFavoriteFolderView(profile: profile)
            }
            .navigationTitle("Favoritos")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    HStack{
                        Spacer()
                        
                        Button {
                            addNewFavoriteFolderIsPresented = true
                        } label: {
                            Image(systemName: "folder.badge.plus")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 35, height: 25)
                        }
                    }
                }
            }
        }
        .task(id: allFolders) {
            folders = allFolders.filter { $0.author.id == profile.id }
            
            folders.sort(by: { $0.name < $1.name })
        }
    }
}

#Preview {
    FavoritesView(profile: previewMyProfile)
}

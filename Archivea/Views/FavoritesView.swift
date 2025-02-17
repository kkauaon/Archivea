import SwiftUI
import SwiftData

struct FavoritesView: View {
    
    @Query var folders: [FavoriteFolder]
    
    @State var addNewFavoriteFolderIsPresented : Bool = false
    
    var body: some View {
        NavigationStack{
            ScrollView {
                HStack{
                    Text("Adicionar pasta de favoritos")
                        .font(.system(size: 20))
                    Spacer()
                    Button {
                        addNewFavoriteFolderIsPresented = true
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 20, height: 20)
                    }
                }
                
                VStack(spacing: 20) {
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
            .scrollIndicators(.never)
            .padding(.horizontal, 16)
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .top
            )
            .sheet(isPresented: $addNewFavoriteFolderIsPresented) {
                AddNewFavoriteFolderView()
            }
            .navigationTitle("Favoritos")
        }
    }
}

#Preview {
    FavoritesView()
}

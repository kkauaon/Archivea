import SwiftUI

struct AvatarView: View {
    var avatarData: Data?
    
    var avatarSize: AvatarSizes

    var body: some View {
        if let avatar = avatarData, let image = UIImage(data: avatar) {
            Image(uiImage: image)
                .resizable()
                
                .aspectRatio(contentMode: .fill)
                .frame(width: avatarSize.size, height: avatarSize.size)
                .clipped()
                .cornerRadius(5)
        } else {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.gray)
                .frame(width: avatarSize.size, height: avatarSize.size)
                .overlay {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 48, height: 48)
                }
        }
    }
}
//Cade o construtor view nao tem construtor que a pssoa vai passar se e 

#Preview {
    AvatarView(avatarData: nil, avatarSize: .large)
}

import SwiftUI

struct AvatarView: View {
    var avatarData: Data?

    var body: some View {
        if let avatar = avatarData, let image = UIImage(data: avatar) {
            Image(uiImage: image)
                .resizable()
                .cornerRadius(5)
                .frame(width: 64, height: 64)
        } else {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.gray)
                .frame(width: 64, height: 64)
                .overlay {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 48, height: 48)
                }
        }
    }
}
#Preview {
    AvatarView()
}

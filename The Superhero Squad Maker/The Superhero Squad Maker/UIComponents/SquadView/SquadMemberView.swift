import SwiftUI

struct SquadMemberView: View {

    @Binding var heroViewModel: Hero

    var body: some View {
        VStack {
            ImageFromUrlView(
                basePath: heroViewModel.thumbnail.path,
                size: .standardMedium,
                fileExtension: heroViewModel.thumbnail.thumbnailExtension
            )
                .clipShape(Circle())
                .frame(width: .xLarge, height: .xLarge)
                .padding(.all, .medium)

            VStack {
                Text(heroViewModel.name)
                    .font(.footnote)
                    .fontWeight(.bold)
                    .lineLimit(2)
                    .foregroundColor(.white)

                Spacer()
            }
            .frame(height: .large)
        }
        .frame(maxWidth: .xLarge)
    }
}

//#Preview {
//    SquadView()
//}

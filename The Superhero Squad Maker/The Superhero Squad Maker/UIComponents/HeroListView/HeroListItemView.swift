import SDWebImageSwiftUI
import SwiftUI

struct HeroListItemView: View {

    @Binding var heroViewModel: Hero

    var body: some View {
        HStack {
            ImageFromUrlView(
                basePath: heroViewModel.thumbnail.path,
                size: .standardMedium,
                fileExtension: heroViewModel.thumbnail.thumbnailExtension
            )
                .clipShape(Circle())
                .frame(width: Margins.large, height: Margins.large)
                .padding(.all, Margins.medium)

            Text(heroViewModel.name)
                .foregroundColor(.white)
                .font(.headline)
                .fontWeight(.bold)
                .lineLimit(1)

            Spacer()

            Image.chevronImage
                .padding(.horizontal, Margins.medium)
                .foregroundColor(Color.greyLight)
        }
        .background(Color.greyMedium)
        .cornerRadius(Margins.small)
    }
}

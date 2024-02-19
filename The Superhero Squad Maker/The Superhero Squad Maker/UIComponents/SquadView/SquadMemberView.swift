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
                .frame(width: Margins.xLarge, height: Margins.xLarge)
                .padding(.all, Margins.medium)

            VStack {
                Text(heroViewModel.name)
                    .font(.footnote)
                    .fontWeight(.bold)
                    .lineLimit(2)
                    .foregroundColor(.white)

                Spacer()
            }
            .frame(height: Margins.large)
        }
        .frame(maxWidth: Margins.xLarge)
    }
}

#Preview {
    @State var viewModel = DeveloperPreview.sampleHero
    return SquadMemberView(heroViewModel: $viewModel)
        .preferredColorScheme(.dark)
}

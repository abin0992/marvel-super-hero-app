import SwiftUI

struct HeroView: View {

    var body: some View {
        HStack {
            Image("placeholder")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: .large, height: .large)
                .padding(.all, .medium)

            Text("placeholder")
                .foregroundColor(.white)
                .font(.headline)
                .fontWeight(.bold)
                .lineLimit(1)

            Spacer()

            Image.chevronImage
                .padding(.horizontal, .medium)
                .foregroundColor(Color.greyLight)
        }
        .background(Color.greyMedium)
    }
}

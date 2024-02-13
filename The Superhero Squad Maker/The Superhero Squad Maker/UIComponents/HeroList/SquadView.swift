import SwiftUI

struct SquadView: View {

    var body: some View {
        VStack {
            Image("placeholder")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: .xLarge, height: .xLarge)

            VStack {
                Text("placeholder")
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

#Preview {
    SquadView()
}

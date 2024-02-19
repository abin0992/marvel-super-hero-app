import SwiftUI

struct SquadButton: View {
    @Binding var isInSquad: Bool

    var action: () -> Void

    var body: some View {
        Button(
            action: {
                action()
            },
            label: {
                Text(isInSquad ? TextContent.squadButtonFireText : TextContent.squadButtonRecruitText)
                .font(.headline)
                .fontWeight(.semibold)
            }
        )
        .frame(height: Margins.large)
        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
        .background(isInSquad ? .clear : .redLight)
        .cornerRadius(Margins.small)
        .shadow(color: .redHighlight, radius: Margins.medium)
        .overlay(
            RoundedRectangle(cornerRadius: Margins.small)
                .stroke(
                    isInSquad ? Color.redLight : .clear,
                    style: StrokeStyle(lineWidth: Margins.xSmall)
                )
        )
        .padding(.horizontal, Margins.medium)
    }
}

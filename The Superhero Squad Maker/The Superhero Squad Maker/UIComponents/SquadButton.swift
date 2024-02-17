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
        .frame(height: .large)
        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
        .background(isInSquad ? .clear : .redLight)
        .cornerRadius(.small)
        .shadow(color: .redHighlight, radius: .medium)
        .overlay(
            RoundedRectangle(cornerRadius: .small)
                .stroke(
                    isInSquad ? Color.redLight : .clear,
                    style: StrokeStyle(lineWidth: .xSmall)
                )
        )
        .padding(.horizontal, .medium)
    }
}

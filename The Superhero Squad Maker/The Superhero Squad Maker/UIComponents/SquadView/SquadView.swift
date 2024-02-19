//
//  SquadView.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 16.02.24.
//

import SwiftUI

struct SquadView: View {

    @Binding var heroList: [Hero]
    let didSelectHero: (Hero) -> Void

    var body: some View {

        VStack(alignment: .leading, spacing: Margins.xSmall) {
            Text(TextContent.mySquadTitle)
                .font(.title3)
                .bold()
                .foregroundColor(.white)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: Margins.medium) {
                    ForEach($heroList) { hero in
                        SquadMemberView(heroViewModel: hero)
                            .listRowBackground(Color.greyDark)
                            .onTapGesture {
                                if Features.isDetailScreenEnabled {
                                    didSelectHero(hero.wrappedValue)
                                }
                            }
                    }
                }
            }
        }
        .frame(height: 157)
        .padding(.horizontal, Margins.medium)
        .padding(.top, Margins.medium)
    }
}

#Preview {

    @State var previewHeroes = DeveloperPreview.previewHeroList.data.results

    return SquadView(heroList: $previewHeroes) { _ in }
        .preferredColorScheme(.dark)
}

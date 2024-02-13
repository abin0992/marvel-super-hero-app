//
//  HeroListView.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 12.02.24.
//

import SwiftUI

struct HeroListView: View {

    @Binding var heroList: [Hero]
    let fetchNextPage: () -> Void

    var body: some View {
        List {
            ForEach($heroList) { hero in
                HeroListItemView(heroViewModel: hero)
                    .listRowBackground(Color.greyDark)
                    .onAppear {
                        if heroList.isLastItem(hero.wrappedValue) {
                            fetchNextPage()
                        }
                    }
            }
        }
        .frame( maxWidth: .infinity)
        .edgesIgnoringSafeArea(.bottom)
        .listStyle(GroupedListStyle())
        .scrollContentBackground(.hidden)
    }
}

#Preview {

    @State var previewHeroes = DeveloperPreview.previewHeroList.data.results

    return HeroListView(heroList: $previewHeroes) {}
}

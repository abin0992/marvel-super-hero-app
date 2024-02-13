//
//  HeroDetailView.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 13.02.24.
//

import SwiftUI
import SDWebImageSwiftUI

struct HeroDetailView: View, NavigationBarCustomisable {

    @State var heroViewModel: Hero

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: .medium) {

                    GeometryReader { geometry in
                        ImageFromUrlView(
                            basePath: heroViewModel.thumbnail.path,
                            size: .detail,
                            fileExtension: heroViewModel.thumbnail.thumbnailExtension
                        )
                        .frame(width: geometry.size.width, height: geometry.size.width)
                        .clipped()
                    }
                    .frame(height: UIScreen.main.bounds.width)

                    Text(heroViewModel.name)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, .medium)

                    SquadButton()

                    Text(heroViewModel.description)
                        .font(.body)
                        .foregroundColor(.white)
                        .padding(.horizontal, .medium)

                    Spacer()
                }
            }
            .background(Color.greyDark)
        }
        .accentColor(.white)
    }
}


//#Preview {
//    HeroDetailView()
//}

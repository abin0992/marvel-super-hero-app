//
//  HeroDetailView.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 13.02.24.
//

import SwiftUI

struct HeroDetailView: View {

    @ObservedObject var viewModel: HeroDetailViewModel

    init(viewModel: HeroDetailViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: .medium) {

                ImageFromUrlView(
                    basePath: viewModel.heroViewModel.thumbnail.path,
                    size: .detail,
                    fileExtension: viewModel.heroViewModel.thumbnail.thumbnailExtension
                )
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                .clipped()

                Text(viewModel.heroViewModel.name)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.horizontal, .medium)

                SquadButton()

                Text(viewModel.heroViewModel.description)
                    .font(.body)
                    .foregroundColor(.white)
                    .padding(.horizontal, .medium)

                Spacer()
            }
        }
        .background(Color.greyDark)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarBackButton {
            viewModel.output.send()
        }
    }
}


//#Preview {
//    HeroDetailView()
//}

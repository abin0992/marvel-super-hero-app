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

                SquadButton(isInSquad: $viewModel.isInMySquad) {
                    if viewModel.isInMySquad {
                        viewModel.showConfirmationAlert = true
                    } else {
                        viewModel.didTapUpdateSquad.send(())
                    }
                }

                Text(viewModel.heroViewModel.heroDescription)
                    .font(.body)
                    .foregroundColor(.white)
                    .padding(.horizontal, .medium)

                Spacer()
            }
            .alert(isPresented: $viewModel.showConfirmationAlert) {
                Alert(
                    title: Text(TextContent.squadButtonFireText),
                    message: Text(TextContent.confirmMessage),
                    primaryButton: .destructive(Text(TextContent.confirmButtonTitle)) {
                        viewModel.didTapUpdateSquad.send(())
                    },
                    secondaryButton: .cancel()
                )
            }
        }
        .background(Color.greyDark)
        .navigationBarBackButtonHidden(true)
        .navigationBarBackButton {
            viewModel.didTapBackButton.send()
        }
    }
}


//#Preview {
//    HeroDetailView()
//}

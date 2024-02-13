//
//  HomeView.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 12.02.24.
//

import Combine
import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            ZStack {
                switch viewModel.state {
                case .data, .loading:
                    ZStack {
                        HeroListView(heroList: $viewModel.heros) {
                            viewModel.fetchNextPage.send(())
                        } didSelectHero: { hero in
                            viewModel.output.send(hero)
                        }
                        if viewModel.state == .loading {
                            FullScreenLoadingView(
                                title: viewModel.offset == 0 ? TextContent.initialLoadingText : TextContent.paginationLoadingText
                            )
                        }
                    }
                case .error(let clientError):
                    ErrorPopupView(
                        title: TextContent.errorOccured,
                        subtitle: clientError.localizedDescription,
                        retryAction: {
                            viewModel.didTapRetry.send(())
                        }
                    )
                default:
                    VStack {}
                }
            }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Image("marvel-logo-nav") // Your image name
                            .resizable()
                            .scaledToFit()
                            .frame(height: 32) // Adjust the frame as needed
                    }
                }
        }
        .navigationBarColor(
            backgroundColor: UIColor(Color.greyDark),
            foregroundColor: UIColor.white
        )
    }
}

#Preview {
    HomeView(viewModel: DeveloperPreview.previewHomeViewModel)
}

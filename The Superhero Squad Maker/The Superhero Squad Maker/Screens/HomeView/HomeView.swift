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
        ZStack {
            switch viewModel.state {
            case .data, .loading:
                ZStack {
                    HeroListView(heroList: $viewModel.heros) {
                        viewModel.fetchNextPage.send(())
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
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView(viewModel: DeveloperPreview.previewHomeViewModel)
}

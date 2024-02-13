//
//  HomeCoordinator.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 12.02.24.
//

import Combine
import SwiftUI
import Swinject

final class HomeCoordinator: Coordinator {

    var rootViewController: UINavigationController = UINavigationController()
    private var cancellables = Set<AnyCancellable>()

    private let resolver: Resolver
    private let resolverEnvironment: ResolverEnvironment

    init(
        resolver: Resolver,
        resolverEnvironment: ResolverEnvironment
    ) {
        self.resolver = resolver
        self.resolverEnvironment = resolverEnvironment
    }

    func start() {
        displayHomeView()
    }

}

private extension HomeCoordinator {

    func displayHomeView() {

        guard let homeViewModel = resolver.resolve(HomeViewModel.self) else {
            return
        }

        homeViewModel.output
            .receive(on: DispatchQueue.main)
            .sink { [weak self] hero in
                self?.navigateToDetailScreen(hero: hero)
            }
            .store(in: &cancellables)

        let homeView = HomeView(viewModel: homeViewModel)
            .environmentObject(resolverEnvironment)
        let homeViewController = UIHostingController(rootView: homeView)
        homeViewController.title = ""

        rootViewController.navigationBar.isHidden = true
        rootViewController.setViewControllers([homeViewController], animated: false)
    }

    func navigateToDetailScreen(hero: Hero) {

//        guard let coinDetailViewModel = resolver.resolve(
//            CoinDetailViewModel.self,
//            argument: coin
//        ) else {
//            return
//        }
        let heroDetailViewModel = HeroDetailViewModel(heroViewModel: hero)

        heroDetailViewModel.output
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.rootViewController.popViewController(animated: true)
                self?.rootViewController.navigationBar.isHidden = true
            }
            .store(in: &cancellables)

        let heroDetailView = HeroDetailView(viewModel: heroDetailViewModel)
            .environmentObject(resolverEnvironment)

        let detailViewController = UIHostingController(rootView: heroDetailView)
        detailViewController.navigationItem.hidesBackButton = true

        rootViewController.navigationBar.isHidden = false
        rootViewController.pushViewController(detailViewController, animated: true)

    }
}

//
//  ModuleAssembly.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 12.02.24.
//

import Foundation
import Swinject

@MainActor
final class ModuleAssembly {

    static let all: [Assembly] = [
        HomeScreenAssembly(),
        HeroDetailAssembly()
    ]

}

@MainActor
final class HomeScreenAssembly: Assembly {

    func assemble(container: Container) {

        container.register(FetchHeroListUseCaseProtocol.self) { resolver in
            FetchHeroListUseCase(
                heroService: resolver.resolve(HeroFetchable.self)!
            )
        }

        container.register(HomeViewModel.self) { resolver in
            HomeViewModel(
                fetchHeroListUseCase: resolver.resolve(FetchHeroListUseCaseProtocol.self)!,
                fetchSquadUseCase: resolver.resolve(FetchSquadUseCaseProtocol.self)!
            )
        }

        container.register(FetchSquadUseCaseProtocol.self) { resolver in
            FetchSquadUseCase(
                storageManager: resolver.resolve(HeroStorageProtocol.self)!
            )
        }
    }
}

@MainActor
final class HeroDetailAssembly: Assembly {

    func assemble(container: Container) {

        container.register(HeroDetailViewModel.self) { resolver, hero in
            HeroDetailViewModel(
                heroViewModel: hero,
                editSquadUseCase: resolver.resolve(EditSquadUseCaseProtocol.self)!,
                fetchSquadUseCase: resolver.resolve(FetchSquadUseCaseProtocol.self)!
            )
        }

        container.register(EditSquadUseCaseProtocol.self) { resolver in
            EditSquadUseCase(
                storageManager: resolver.resolve(HeroStorageProtocol.self)!
            )
        }
    }
}

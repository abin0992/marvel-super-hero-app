//
//  FetchHeroListUseCase.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 12.02.24.
//

import Combine
import Foundation

protocol FetchHeroListUseCaseProtocol {
    func execute(offset: String) -> AnyPublisher<DomainResult<SquadListResponse>, Never>
}

final class FetchHeroListUseCase: FetchHeroListUseCaseProtocol {

    private let heroService: HeroFetchable

    init(heroService: HeroFetchable) {
        self.heroService = heroService
    }

    func execute(offset: String) -> AnyPublisher<DomainResult<SquadListResponse>, Never> {
        heroService
            .fetchHeroList(offset: offset)
            .map(DomainResult<SquadListResponse>.success)
            .catch { error in
                Just(.error(error))
            }
            .eraseToAnyPublisher()
    }
}

// MARK: For preview
final class PreviewFetchHeroListUseCase: FetchHeroListUseCaseProtocol {
    func execute(offset: String) -> AnyPublisher<DomainResult<SquadListResponse>, Never> {
        Just(DeveloperPreview.previewHeroList)
            .map(DomainResult<SquadListResponse>.success)
            .eraseToAnyPublisher()
    }
}

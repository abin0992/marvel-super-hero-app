//
//  HomeViewModel.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 12.02.24.
//

import Combine
import Foundation
import SwiftData

@MainActor
final class HomeViewModel: ObservableObject {

    private(set) var output = PassthroughSubject<Hero, Never>()

    @Published var state = StateModel<[Hero]>.State.loading
    @Published var allHeros: [Hero] = []
    @Published var squad: [Hero] = []

    let didTapRetry = PassthroughSubject<Void, Never>()
    let fetchNextPage = PassthroughSubject<Void, Never>()

    var offset = 0
    private var total = 0
    private var subscriptions = Set<AnyCancellable>()

    private lazy var fetchHeroListResult = makeFetchHeroListResult()
        .share()
    private lazy var fetchMySquad = fetchMySquadResult()

    private let fetchHeroListUseCase: FetchHeroListUseCaseProtocol
    private let fetchSquadUseCase: FetchSquadUseCaseProtocol

    init(
        fetchHeroListUseCase: FetchHeroListUseCaseProtocol,
        fetchSquadUseCase: FetchSquadUseCaseProtocol
    ) {
        self.fetchHeroListUseCase = fetchHeroListUseCase
        self.fetchSquadUseCase = fetchSquadUseCase

        setUpBindings()
    }

}

private extension HomeViewModel {

    func setUpBindings() {
        bindState()
        bindSquad()
    }

    func bindState() {
        fetchHeroListResult
            .receive(on: DispatchQueue.main)
            .map { [weak self] result -> StateModel<[Hero]>.State in
                guard let self else { return StateModel.State.error(ClientError.unknown) }
                switch result {
                case .error:
                    return .error(ClientError.generic)
                case .success(let response):
                    self.allHeros.append(contentsOf: response.data.results)
                    self.offset += response.data.count
                    self.total = response.data.total
                    return .data(self.allHeros)
                }
            }
            .assign(to: &$state)

        Publishers.Merge(
            didTapRetry,
            fetchNextPage
        )
        .map { .loading }
        .assign(to: &$state)
    }

    func bindSquad()  {
        fetchMySquad
            .map { $0 }
            .replaceError(with: [])
            .assign(to: &$squad)
    }

    func fetchMySquadResult() -> AnyPublisher<[Hero], Error> {
        Publishers.Merge(
            Just(()),
            NotificationCenter.default.publisher(for: .squadUpdated)
                .mapToVoid()
        )
        .flatMap { [fetchSquadUseCase] _ -> AnyPublisher<[Hero], Error> in
            fetchSquadUseCase.execute()
        }
        .eraseToAnyPublisher()
    }
}

private extension HomeViewModel {
    func makeFetchHeroListResult() -> AnyPublisher<DomainResult<SquadListResponse>, Never> {
        Publishers.Merge3(
            Just<Void>(()),
            didTapRetry,
            fetchNextPage
        )
        .flatMap { [weak self] _ -> AnyPublisher<DomainResult<SquadListResponse>, Never> in
            guard let self else { return Empty().eraseToAnyPublisher() }
            return self.fetchHeroListUseCase.execute(
                offset: String(self.offset)
            )
        }
        .eraseToAnyPublisher()
    }
}

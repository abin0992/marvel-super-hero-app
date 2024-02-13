//
//  HomeViewModel.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 12.02.24.
//

import Combine
import Foundation

final class HomeViewModel: ObservableObject {

    private(set) var output = PassthroughSubject<Hero, Never>()

    @Published var state = StateModel<[Hero]>.State.loading
    @Published var heros: [Hero] = []

    let didTapRetry = PassthroughSubject<Void, Never>()
    let fetchNextPage = PassthroughSubject<Void, Never>()

    var offset = 0
    private var total = 0
    private var subscriptions = Set<AnyCancellable>()

    private lazy var fetchHeroListResult = makeFetchHeroListResult()
        .share()

    private let fetchHeroListUseCase: FetchHeroListUseCaseProtocol

    init(fetchHeroListUseCase: FetchHeroListUseCaseProtocol) {
        self.fetchHeroListUseCase = fetchHeroListUseCase
        setUpBindings()
    }

}

private extension HomeViewModel {

    func setUpBindings() {
        bindState()
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
                    self.heros.append(contentsOf: response.data.results)
                    self.offset += response.data.count
                    self.total = response.data.total
                    return .data(self.heros)
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

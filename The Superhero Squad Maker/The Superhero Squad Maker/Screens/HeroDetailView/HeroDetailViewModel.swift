//
//  HeroDetailViewModel.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 13.02.24.
//

import Combine
import CombineExt
import Foundation

@MainActor
final class HeroDetailViewModel: ObservableObject {

    private(set) var didTapBackButton = PassthroughSubject<Void, Never>()
    let didTapUpdateSquad = PassthroughSubject<Void, Never>()
    private var cancellables = Set<AnyCancellable>()

    private lazy var fetchMySquad = fetchSquadUseCase.execute()
    private lazy var editSquadResult = makeEditSquadResult()

    @Published var isInMySquad = false
    @Published var showConfirmationAlert = false

    @Published var heroViewModel: Hero
    private let editSquadUseCase: EditSquadUseCaseProtocol
    private let fetchSquadUseCase: FetchSquadUseCaseProtocol

    init(
        heroViewModel: Hero,
        editSquadUseCase: EditSquadUseCaseProtocol,
        fetchSquadUseCase: FetchSquadUseCaseProtocol
    ) {
        self.heroViewModel = heroViewModel
        self.editSquadUseCase = editSquadUseCase
        self.fetchSquadUseCase = fetchSquadUseCase

        setUpBindings()
    }
}

private extension HeroDetailViewModel {
    func setUpBindings() {
        bindSquadButton()
        bindEditSquad()
    }

    func bindSquadButton() {
        fetchMySquad
            .map { [heroViewModel] mySquad -> Bool in
                mySquad.contains(where: { $0.id == heroViewModel.id })
            }
            .replaceError(with: false)
            .assign(to: &$isInMySquad)
    }

    func bindEditSquad() {
        editSquadResult
            .compactMap { [weak self] _ -> Bool in
                guard let self else { return false }
                return !self.isInMySquad
            }
            .replaceError(with: isInMySquad)
            .receive(on: DispatchQueue.main)
            .assign(to: &$isInMySquad)
    }
}

private extension HeroDetailViewModel {

    func makeEditSquadResult() -> AnyPublisher<Void, Error> {
        didTapUpdateSquad
            .withLatestFrom($isInMySquad)
            .flatMap { [editSquadUseCase, heroViewModel] isInMySquad -> AnyPublisher<Void, Error> in
                editSquadUseCase.execute(
                    hero: heroViewModel,
                    isInSquad: isInMySquad
                )
            }
            .eraseToAnyPublisher()
    }
}

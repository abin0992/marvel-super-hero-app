//
//  EditSquadUseCase.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 16.02.24.
//

import Combine
import Foundation

protocol EditSquadUseCaseProtocol {
    func execute(hero: Hero, isInSquad: Bool) -> AnyPublisher<Void, Error>
}

final class EditSquadUseCase: EditSquadUseCaseProtocol {

    private var storageManager: HeroStorageProtocol

    init(storageManager: HeroStorageProtocol) {
        self.storageManager = storageManager
    }

    func execute(hero: Hero, isInSquad: Bool) -> AnyPublisher<Void, Error> {
        let operation = isInSquad ? storageManager.delete : storageManager.save
        return performStorageOperation(operation, with: hero)
    }
}

private extension EditSquadUseCase {

    func performStorageOperation(
        _ operation: @escaping (Hero) throws -> Void,
        with hero: Hero
    ) -> AnyPublisher<Void, Error> {
        Future<Void, Error> { promise in
            do {
                try operation(hero)
                NotificationCenter.default.post(name: .squadUpdated, object: nil)
                promise(.success(()))
            } catch {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
}

final class PreviewEditSquadUseCase: EditSquadUseCaseProtocol {
    func execute(hero: Hero, isInSquad: Bool) -> AnyPublisher<Void, Error> {
        Just(())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

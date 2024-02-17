//
//  FetchSquadUseCase.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 16.02.24.
//

import Combine
import Foundation

protocol FetchSquadUseCaseProtocol {
    func execute() -> AnyPublisher<[Hero], Error>
}

final class FetchSquadUseCase: FetchSquadUseCaseProtocol {

    private var storageManager: HeroStorageProtocol

    init(storageManager: HeroStorageProtocol) {
        self.storageManager = storageManager
    }

    func execute() -> AnyPublisher<[Hero], Error> {
        return Future<[Hero], Error> { [storageManager] promise in
            do {
                let squad = try storageManager.fetch()
                promise(.success((squad)))
            } catch {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
}

// MARK: For preview
final class PreviewFetchSquadUseCase: FetchSquadUseCaseProtocol {
    func execute() -> AnyPublisher<[Hero], Error> {
        Just(DeveloperPreview.previewHeroList.data.results)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

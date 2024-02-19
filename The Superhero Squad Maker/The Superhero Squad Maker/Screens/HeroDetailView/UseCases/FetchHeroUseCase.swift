//
//  FetchHeroUseCase.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 19.02.24.
//

import Combine
import Foundation

protocol FetchHeroUseCaseProtocol {
    func execute(id: String) -> AnyPublisher<Hero?, Never>
}

final class FetchHeroUseCase: FetchHeroUseCaseProtocol {

    private var storageManager: HeroStorageProtocol

    init(storageManager: HeroStorageProtocol) {
        self.storageManager = storageManager
    }

    func execute(id: String) -> AnyPublisher<Hero?, Never> {
        Just(storageManager.fetchObject(by: id))
            .eraseToAnyPublisher()
    }
}

// MARK: For preview
final class PreviewFetchHeroUseCase: FetchHeroUseCaseProtocol {
    func execute(id: String) -> AnyPublisher<Hero?, Never> {
        Just(nil)
            .eraseToAnyPublisher()
    }
}

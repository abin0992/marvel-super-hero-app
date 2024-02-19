//
//  MockUseCase.swift
//  The Superhero Squad MakerTests
//
//  Created by Abin Baby on 18.02.24.
//

import Combine
import Foundation
@testable import The_Superhero_Squad_Maker

final class MockEditSquadUseCase: EditSquadUseCaseProtocol {
    var expectedResult: Result<Void, Error> = .success(())
    func execute(hero: Hero, isInSquad: Bool) -> AnyPublisher<Void, Error> {
        expectedResult.publisher.eraseToAnyPublisher()
    }
}

final class MockFetchSquadUseCase: FetchSquadUseCaseProtocol {
    var heroes: [Hero] = []
    func execute() -> AnyPublisher<[Hero], Error> {
        Just(heroes).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}

final class MockFetchHeroListUseCase: FetchHeroListUseCaseProtocol {
    var stubbedHeros: HeroListResponse = HeroListResponse(
        data: DataClass(
            offset: 0,
            limit: 0,
            total: 0,
            count: 0,
            results: [
                Hero(
                    id: "1",
                    name: "Iron man",
                    heroDescription: "Tony Stark is a genius inventor and billionaire industrialist, who suits up in his armor of cutting-edge technology to become the super hero Iron Man.",
                    thumbnail: Thumbnail(
                        path: "",
                        thumbnailExtension: "gif"
                    )
                )
            ]
        )
    )

    var stubbedError: Error?
    private let subject = PassthroughSubject<DomainResult<HeroListResponse>, Never>()

    func execute(offset: String) -> AnyPublisher<DomainResult<HeroListResponse>, Never> {
        subject.eraseToAnyPublisher()
    }

    func sendHeros() {
        subject.send(.success(stubbedHeros))
    }

    func sendError() {
        let error = stubbedError ?? ClientError.generic
        subject.send(.error(error))
    }
}

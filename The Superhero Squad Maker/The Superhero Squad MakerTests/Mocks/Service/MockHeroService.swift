//
//  MockHeroService.swift
//  The Superhero Squad MakerTests
//
//  Created by Abin Baby on 18.02.24.
//

import Combine
@testable import The_Superhero_Squad_Maker

final class MockHeroService: HeroFetchable {

    var stubbedFetchHeroListResult: AnyPublisher<HeroListResponse, Error>!

    func fetchHeroList(offset: String) -> AnyPublisher<HeroListResponse, Error> {
        stubbedFetchHeroListResult
    }
}

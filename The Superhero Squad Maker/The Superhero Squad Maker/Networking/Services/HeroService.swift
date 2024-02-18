//
//  HeroService.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 12.02.24.
//

import Combine
import Foundation

protocol HeroFetchable {
    func fetchHeroList(offset: String) -> AnyPublisher<SquadListResponse, Error>
}

final class HeroService: HeroFetchable {

    private lazy var decoder = JSONDecoder()

    private let config: HeroNetworkConfigurable = HeroUrlConfig.shared

    private let httpClient: HTTPClientProtocol

    init(httpClient: HTTPClientProtocol) {
        self.httpClient = httpClient
    }

    func fetchHeroList(offset: String) -> AnyPublisher<SquadListResponse, Error> {
        httpClient.performRequest(
            url: config.fetchAllHeros(offset: offset).url,
            method: .get,
            body: nil
        )
        .decode(type: SquadListResponse.self, decoder: decoder)
        .eraseToAnyPublisher()
    }
}

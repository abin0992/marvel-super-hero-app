//
//  HeroListEndPoint.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 12.02.24.
//

import Foundation

protocol HeroNetworkConfigurable {
    func fetchAllHeros(offset: String) -> URLConfig
}

struct HeroUrlConfig: HeroNetworkConfigurable {

    static let shared: HeroUrlConfig = HeroUrlConfig()

    private init() {}

    func fetchAllHeros(offset: String) -> URLConfig {
        Endpoint(
            path: "/v1/public/characters",
            additionalQueryItems: [
                URLQueryItem(name: "limit", value: AppConfiguration.paginationLimit),
                URLQueryItem(name: "offset", value: offset)
            ]
        )
    }
}

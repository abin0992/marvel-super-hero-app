//
//  SquadListEndPoint.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 12.02.24.
//

import Foundation

protocol SquadListNetworkConfigurable {
    func fetchAllHeros(offset: String) -> URLConfig
}

struct SquadUrlConfig: SquadListNetworkConfigurable {

    static let shared: SquadUrlConfig = SquadUrlConfig()

    func fetchAllHeros(offset: String) -> URLConfig {
        Endpoint(
            path: "/v1/public/characters",
            additionalQueryItems: [
                URLQueryItem(name: "limit", value: "50"),
                URLQueryItem(name: "offset", value: offset)
            ]
        )
    }
}

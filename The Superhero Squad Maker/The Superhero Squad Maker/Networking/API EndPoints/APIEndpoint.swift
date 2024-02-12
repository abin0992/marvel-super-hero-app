//
//  APIEndpoint.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 12.02.24.
//

import Foundation

// MARK: - HTTPMethod

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

// MARK: - URLConfig

protocol URLConfig {
    var url: URL { get }
}

// MARK: - PEEndPoint

struct Endpoint: URLConfig, AuthenticationProtocol {

    let path: String
    private let additionalQueryItems: [URLQueryItem]

    init(
        path: String,
        additionalQueryItems: [URLQueryItem] = []
    ) {
        self.path = path
        self.additionalQueryItems = additionalQueryItems
    }

    var queryItems: [URLQueryItem] {
        let timestamp = String(Date().timeIntervalSince1970)

        var authenticationQueryItems = [
            URLQueryItem(name: "ts", value: timestamp),
            URLQueryItem(name: "hash", value: headerHash(timeStamp: timestamp)),
            URLQueryItem(name: "apikey", value: AppConfiguration.publicKey)
        ]
        authenticationQueryItems.append(contentsOf: additionalQueryItems)

        return authenticationQueryItems
    }

    var url: URL {
        var components: URLComponents = URLComponents()
        components.scheme = "https"
        components.host = AppConfiguration.apiBaseURL
        components.path = path
        components.queryItems = queryItems

        guard let url = components.url else {
            preconditionFailure(
                "Invalid URL components: \(components)"
            )
        }
        return url
    }
}

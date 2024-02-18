//
//  ImageEndpoint.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 13.02.24.
//

import Foundation

// MARK: - EndPoint

struct ImageEndpoint: URLConfig {

    private let basePath: String
    private let size: String
    private let fileExtension: String

    init(
        basePath: String,
        size: ImageSize,
        fileExtension: String
    ) {
        self.basePath = basePath
        self.size = size.rawValue
        self.fileExtension = fileExtension
    }

    var url: URL {

        let urlString = "\(basePath)/\(size).\(fileExtension)"
        guard let url = URL(string: urlString) else {
            preconditionFailure(
                "Invalid URL"
            )
        }
        return url
    }
}

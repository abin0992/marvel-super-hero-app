//
//  ImageEndpoint.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 13.02.24.
//

import Foundation

// MARK: - EndPoint

struct ImageEndpoint: URLConfig {
    let basePath: String
    let size: String
    let fileExtension: String

    var url: URL {

        let urlString = "\(basePath)/\(size).\(fileExtension)"

        guard let url = URL(string: urlString) else {
            preconditionFailure(
                "Invalid URL"
            )
        }

        return url
    }

    init(
        basePath: String,
        size: ImageSize,
        fileExtension: FileExtension
    ) {
        self.basePath = basePath
        self.size = size.rawValue
        self.fileExtension = fileExtension.rawValue
    }
}

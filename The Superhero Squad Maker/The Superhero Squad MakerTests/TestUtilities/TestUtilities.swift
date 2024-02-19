//
//  TestUtilities.swift
//  The Superhero Squad MakerTests
//
//  Created by Abin Baby on 18.02.24.
//

import Foundation
@testable import The_Superhero_Squad_Maker

final class TestUtilities {

    static func load<T: Decodable>(fromJSON fileName: String, type: T.Type) -> T {
        guard let url = Bundle(for: TestUtilities.self).url(forResource: fileName, withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(fileName).json from test bundle.")
        }
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Failed to decode \(fileName).json: \(error)")
        }
    }

    static func data(fromJSON fileName: String) -> Data {
        guard 
            let url = Bundle(for: TestUtilities.self).url(forResource: fileName, withExtension: "json"),
              let data = try? Data(contentsOf: url)
        else {
            fatalError("Failed to load \(fileName).json from test bundle.")
        }
        return data
    }

    static let testHero = Hero(
        id: "1",
        name: "Test Hero",
        heroDescription: "A hero for testing purposes",
        thumbnail: Thumbnail(
            path: "path/to/thumbnail",
            thumbnailExtension: "jpg"
        )
    )
}

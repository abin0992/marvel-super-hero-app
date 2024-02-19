//
//  MockHeroStorage.swift
//  The Superhero Squad MakerTests
//
//  Created by Abin Baby on 18.02.24.
//

import Foundation
@testable import The_Superhero_Squad_Maker

final class MockHeroStorage: HeroStorageProtocol {

    var heroes = [Hero]()
    var error: Error?
    var shouldThrowError = false

    func save(_ model: Hero) throws {
        heroes.append(model)
        if shouldThrowError { throw ClientError.persistanceError }
    }

    func fetch() throws -> [Hero] {
        if let error = error {
            throw error
        }
        return heroes
    }

    func delete(_ model: Hero) throws {
        if shouldThrowError { throw ClientError.persistanceError }
    }

    func fetchObject(by id: String) -> Hero? {
        heroes.first(where: { $0.id == id })
    }
}

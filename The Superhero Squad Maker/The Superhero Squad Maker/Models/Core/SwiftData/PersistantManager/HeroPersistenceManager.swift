//
//  SquadStorageProtocol.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 15.02.24.
//

import Foundation
import SwiftData

protocol HeroStorageProtocol {
    func save(_ model: Hero) throws
    func fetch() throws -> [Hero]
    func delete(_ model: Hero) throws
}

final class HeroPersistenceManager: BasePersistenceManager<HeroPersistentModel>, HeroStorageProtocol { }

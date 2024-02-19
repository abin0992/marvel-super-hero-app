//
//  BasePersistenceManager.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 15.02.24.
//

import Foundation
import SwiftData

@MainActor
class BasePersistenceManager<T>: ManagerProtocol where T: StorageProtocol, T: PersistentModel, T.EntityType: CommonModelProtocol {
    typealias EntityType = T.EntityType

    let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    private var items: [EntityType] = []

    func save(_ model: EntityType) throws {
        do {
            context.insert(T(model))
            try context.save()
        } catch {
            DLog(error.localizedDescription)
        }
    }

    func fetch() throws -> [EntityType] {
        let descriptor = FetchDescriptor<T>() // (sortBy: [SortDescriptor(\.title)])
        let dbitems = try context.fetch(descriptor)
        items = dbitems.map { $0.getModel() }
        return items
    }

    func delete(_ model: EntityType) throws {
        do {
            context.delete(T(model))
            try context.save()
        } catch {
            DLog(error.localizedDescription)
        }
    }

    func fetchObject(by id: String) -> EntityType? {
        return nil
    }
}

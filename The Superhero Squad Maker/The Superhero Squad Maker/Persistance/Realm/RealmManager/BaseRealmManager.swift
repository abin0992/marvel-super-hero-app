//
//  BaseRealmManager.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 19.02.24.
//

import Foundation
import RealmSwift

@MainActor
class BaseRealmManager<T>: ManagerProtocol where T: StorageProtocol, T: Object, T.EntityType: CommonModelProtocol {
    typealias EntityType = T.EntityType

    private var items: [EntityType] = []

    init() {}

    func save(_ model: EntityType) throws {
        let realm = try Realm()
        try realm.write {
            realm.add(T(model))
        }
    }

    func fetch() throws -> [EntityType] {
        let realm = try Realm()
        let objects = realm.objects(T.self)
        return objects.map { $0.getModel() }
    }

    func delete(_ model: EntityType) throws {
        let realm = try Realm()

        guard
            let modelObject = realm.object(
                ofType: T.self,
                forPrimaryKey: model.id
            )
        else {
            throw ClientError.persistanceError
        }

        do {
            try realm.write {
                realm.delete(modelObject)
            }
        } catch {
            throw ClientError.persistanceError
        }
    }

    func fetchObject(by id: String) -> EntityType? {
        do {
            let realm = try Realm()
            guard
                let modelObject = realm.object(
                    ofType: T.self,
                    forPrimaryKey: id
                )
            else {
                return nil
            }
            return modelObject as? BaseRealmManager<T>.EntityType
        } catch {
            return nil
        }
    }
}

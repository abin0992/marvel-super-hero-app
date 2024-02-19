//
//  HeroRealmModel.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 19.02.24.
//

import Foundation
import RealmSwift

class HeroRealmModel: Object, StorageProtocol {
    typealias EntityType = Hero

    @Persisted(primaryKey: true) var id: String
    @Persisted var name: String = ""
    @Persisted var heroDescription: String = ""
    @Persisted var thumbnailModel: ThumbnailRealmModel?

    override static func primaryKey() -> String? {
        return "id"
    }

    required convenience init(_ entity: Hero) {
        self.init()
        id = entity.id
        name = entity.name
        heroDescription = entity.heroDescription
        thumbnailModel = ThumbnailRealmModel(entity.thumbnail)
    }

    func getModel() -> Hero {
        Hero(
            id: id,
            name: name,
            heroDescription: heroDescription,
            thumbnail: Thumbnail(
                path: thumbnailModel?.path ?? "",
                thumbnailExtension: thumbnailModel?.thumbnailExtension ?? ""
            )
        )
    }
}

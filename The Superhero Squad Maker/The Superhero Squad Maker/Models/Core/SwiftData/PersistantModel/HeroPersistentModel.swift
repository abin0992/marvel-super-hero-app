//
//  HeroPersistentModel.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 15.02.24.
//

import Foundation
import SwiftData

@Model
final class HeroPersistentModel: Identifiable, Hashable, StorageProtocol {
    typealias EntityType = Hero

    @Attribute(.unique) public var id: Int
    var name: String
    var heroDescription: String
    @Relationship(deleteRule: .nullify)
    var thumbnailModel: ThumbnailPersistantModel

    required init(_ entity: Hero) {
        id = entity.id
        name = entity.name
        heroDescription = entity.heroDescription
        thumbnailModel = ThumbnailPersistantModel(
            path: entity.thumbnail.path,
            thumbnailExtension: entity.thumbnail.thumbnailExtension
        )
    }

    init(
        id: Int,
        name: String,
        heroDescription: String,
        thumbnail: Thumbnail
    ) {
        self.id = id
        self.name = name
        self.heroDescription = heroDescription
        self.thumbnailModel = ThumbnailPersistantModel(
            path: thumbnail.path,
            thumbnailExtension: thumbnail.thumbnailExtension
        )
    }

    func getModel() -> Hero {
        Hero(
            id: id,
            name: name,
            heroDescription: heroDescription,
            thumbnail: Thumbnail(
                path: thumbnailModel.path,
                thumbnailExtension: thumbnailModel.thumbnailExtension
            )
        )
    }
}

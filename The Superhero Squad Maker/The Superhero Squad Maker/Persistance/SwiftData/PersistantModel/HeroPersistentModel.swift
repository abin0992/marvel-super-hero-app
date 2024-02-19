//
//  HeroPersistentModel.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 15.02.24.
//

import Foundation
import SwiftData

@Model
final class HeroPersistentModel: Identifiable, Hashable, StorageProtocol, CommonModelProtocol {
    typealias EntityType = Hero

    @Attribute(.unique) var id: String
    var name: String
    var heroDescription: String
    @Relationship(deleteRule: .cascade) var thumbnailModel: ThumbnailPersistantModel

    init(_ entity: Hero) {
        id = entity.id
        name = entity.name
        heroDescription = entity.heroDescription
        thumbnailModel = ThumbnailPersistantModel(entity.thumbnail)
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

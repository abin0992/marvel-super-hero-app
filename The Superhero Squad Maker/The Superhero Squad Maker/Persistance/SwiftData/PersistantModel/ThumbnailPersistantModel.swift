//
//  ThumbnailPersistantModel.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 16.02.24.
//

import Foundation
import SwiftData

@Model
final class ThumbnailPersistantModel: Identifiable, Hashable, StorageProtocol, CommonModelProtocol {

    typealias EntityType = Thumbnail

    @Attribute(.unique) var id: String
    var path: String
    var thumbnailExtension: String

    init(_ entity: Thumbnail) {
        id = UUID().uuidString
        self.path = entity.path
        self.thumbnailExtension = entity.thumbnailExtension
    }

    func getModel() -> Thumbnail {
        Thumbnail(
            path: path,
            thumbnailExtension: thumbnailExtension
        )
    }
}

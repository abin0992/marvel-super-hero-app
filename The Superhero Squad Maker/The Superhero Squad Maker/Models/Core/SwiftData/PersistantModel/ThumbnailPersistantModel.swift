//
//  ThumbnailPersistantModel.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 16.02.24.
//

import Foundation
import SwiftData

@Model
class ThumbnailPersistantModel {

    let path: String
    let thumbnailExtension: String

    init(
        path: String,
        thumbnailExtension: String
    ) {
        self.path = path
        self.thumbnailExtension = thumbnailExtension
    }
}

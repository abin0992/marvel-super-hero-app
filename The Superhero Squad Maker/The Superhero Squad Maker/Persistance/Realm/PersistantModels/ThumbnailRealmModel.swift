//
//  ThumbnailRealmModel.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 19.02.24.
//

import Foundation
import RealmSwift

class ThumbnailRealmModel: EmbeddedObject {

    @Persisted var path: String = ""
    @Persisted var thumbnailExtension: String = ""

    override init() {
        super.init()
        path = ""
        thumbnailExtension = ""
    }

    convenience init(_ thumbnail: Thumbnail) {
        self.init()
        path = thumbnail.path
        thumbnailExtension = thumbnail.thumbnailExtension
    }
}

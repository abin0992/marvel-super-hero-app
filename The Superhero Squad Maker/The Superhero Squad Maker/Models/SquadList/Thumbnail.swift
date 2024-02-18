//
//  Thumbnail.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 18.02.24.
//

import Foundation

struct Thumbnail: Codable, Equatable {
    let path: String
    let thumbnailExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

//
//  SquadList.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 12.02.24.
//

import Foundation

// MARK: - SquadList
struct SquadListResponse: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Hero]
}

// MARK: - Result
struct Hero: Codable, Equatable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
}

// MARK: - Thumbnail
struct Thumbnail: Codable, Equatable {
    let path: String
    let thumbnailExtension: FileExtension

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

enum FileExtension: String, Codable {
    case gif
    case jpg
    case png
}

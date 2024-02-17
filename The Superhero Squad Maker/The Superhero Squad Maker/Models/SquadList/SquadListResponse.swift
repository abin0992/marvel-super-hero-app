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
struct Hero: Codable, Equatable, Identifiable, CommonModelProtocol {
    let id: Int
    let name: String
    let heroDescription: String
    let thumbnail: Thumbnail

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case heroDescription = "description"
        case thumbnail
    }
}

// MARK: - Thumbnail
struct Thumbnail: Codable, Equatable {
    let path: String
    let thumbnailExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

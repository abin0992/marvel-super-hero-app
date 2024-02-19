//
//  Hero.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 18.02.24.
//

import Foundation

struct Hero: Codable, Equatable, Identifiable, CommonModelProtocol {
    let id: String
    let name: String
    let heroDescription: String
    let thumbnail: Thumbnail

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case heroDescription = "description"
        case thumbnail
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let idInt = try container.decode(Int.self, forKey: .id)
        id = String(idInt)
        name = try container.decode(String.self, forKey: .name)
        heroDescription = try container.decode(String.self, forKey: .heroDescription)
        thumbnail = try container.decode(Thumbnail.self, forKey: .thumbnail)
    }

    init(
        id: String,
        name: String,
        heroDescription: String,
        thumbnail: Thumbnail
    ) {
        self.id = id
        self.name = name
        self.heroDescription = heroDescription
        self.thumbnail = thumbnail
    }
}

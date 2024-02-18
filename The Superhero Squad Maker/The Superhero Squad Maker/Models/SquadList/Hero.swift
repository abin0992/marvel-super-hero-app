//
//  Hero.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 18.02.24.
//

import Foundation

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

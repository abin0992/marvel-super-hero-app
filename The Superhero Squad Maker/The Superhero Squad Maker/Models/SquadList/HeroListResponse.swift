//
//  SquadList.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 12.02.24.
//

import Foundation

// MARK: - SquadList
struct HeroListResponse: Codable {
    let data: DataClass
}

struct DataClass: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Hero]
}

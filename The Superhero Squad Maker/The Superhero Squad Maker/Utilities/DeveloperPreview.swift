//
//  DeveloperPreview.swift
//  CryptoPrice
//
//  Created by Abin Baby on 07.02.24.
//

import Foundation

@MainActor
final class DeveloperPreview {

    static let instance = DeveloperPreview()

    private init() {}

    static let sampleHero = Hero(
        id: 1,
        name: "Iron man",
        heroDescription: "Tony Stark is a genius inventor and billionaire industrialist, who suits up in his armor of cutting-edge technology to become the super hero Iron Man.",
        thumbnail: Thumbnail(
            path: "",
            thumbnailExtension: "gif"
        )
    )
    
    static let previewHeroList = HeroListResponse(
        data: DataClass(
            offset: 0,
            limit: 0,
            total: 0,
            count: 0,
            results: [
                sampleHero
            ]
        )
    )

    static let previewHomeViewModel = HomeViewModel(
        fetchHeroListUseCase: PreviewFetchHeroListUseCase(),
        fetchSquadUseCase: PreviewFetchSquadUseCase()
    )

    static let previewHeroDetailViewModel = HeroDetailViewModel(
        heroViewModel: sampleHero,
        editSquadUseCase: PreviewEditSquadUseCase(),
        fetchSquadUseCase: PreviewFetchSquadUseCase()
    )
}

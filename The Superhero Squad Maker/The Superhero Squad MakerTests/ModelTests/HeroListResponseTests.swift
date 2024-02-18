//
//  HeroListResponseTests.swift
//  The Superhero Squad MakerTests
//
//  Created by Abin Baby on 18.02.24.
//

import Foundation
@testable import The_Superhero_Squad_Maker
import XCTest

final class HeroListResponseTests: XCTestCase {

    private var stubbedResponse: HeroListResponse!

    override func setUp() {
        super.setUp()

        stubbedResponse = TestUtilities.load(
            fromJSON: "hero_list_sample",
            type: HeroListResponse.self
        )
    }

    override func tearDown() {
        stubbedResponse = nil
        super.tearDown()
    }

    func testSquadListResponseDecoding() {
        XCTAssertEqual(stubbedResponse.data.offset, 0)
        XCTAssertEqual(stubbedResponse.data.limit, 50)
        XCTAssertEqual(stubbedResponse.data.total, 1564)
        XCTAssertEqual(stubbedResponse.data.count, 50)
        XCTAssertEqual(stubbedResponse.data.results.count, 50)
    }

    func testHeroDecoding() {
        let hero = stubbedResponse.data.results.first!
        XCTAssertEqual(hero.id, 1011334)
        XCTAssertEqual(hero.name, "3-D Man")
        XCTAssertEqual(hero.heroDescription, "")
        XCTAssertEqual(hero.thumbnail.path, "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784")
        XCTAssertEqual(hero.thumbnail.thumbnailExtension, "jpg")
    }

    func testThumbnailEquatable() {
        let thumbnail1 = Thumbnail(path: "http://example.com/image", thumbnailExtension: "jpg")
        let thumbnail2 = Thumbnail(path: "http://example.com/image", thumbnailExtension: "jpg")
        XCTAssertEqual(thumbnail1, thumbnail2)
    }

    func testHeroEquatable() {
        let thumbnail = Thumbnail(path: "http://example.com/image", thumbnailExtension: "jpg")
        let hero1 = Hero(
            id: 1,
            name: "Hero Name",
            heroDescription: "Hero Description",
            thumbnail: thumbnail
        )

        let hero2 = Hero(
            id: 1,
            name: "Hero Name",
            heroDescription: "Hero Description",
            thumbnail: thumbnail
        )

        XCTAssertEqual(hero1, hero2)
    }
}

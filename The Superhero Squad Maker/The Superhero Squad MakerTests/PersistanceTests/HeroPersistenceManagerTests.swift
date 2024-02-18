//
//  HeroPersistenceManagerTests.swift
//  The Superhero Squad MakerTests
//
//  Created by Abin Baby on 18.02.24.
//

@testable import The_Superhero_Squad_Maker
import XCTest

final class HeroPersistenceManagerTests: XCTestCase {

    private var mockHeroStorage: MockHeroStorage!

    override func setUp() {
        super.setUp()
        mockHeroStorage = MockHeroStorage()
    }

    override func tearDown() {
        mockHeroStorage = nil
        super.tearDown()
    }

    func testInsert() {
        let hero = TestUtilities.testHero
        do {
            try mockHeroStorage.save(hero)
            let recordFromDb = try mockHeroStorage.fetch().filter { $0.id == hero.id }.first
            XCTAssertTrue(recordFromDb == hero)
        } catch {
            XCTFail("Error occured \(error)")
        }
    }

    // TODO: Add more tests
}

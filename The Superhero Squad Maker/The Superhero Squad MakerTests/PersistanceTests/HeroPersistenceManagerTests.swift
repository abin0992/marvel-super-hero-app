//
//  HeroPersistenceManagerTests.swift
//  The Superhero Squad MakerTests
//
//  Created by Abin Baby on 18.02.24.
//

@testable import The_Superhero_Squad_Maker
import XCTest

final class HeroPersistenceManagerTests: XCTestCase {

    private var systemUnderTest: MockHeroStorage!

    override func setUp() {
        super.setUp()
        systemUnderTest = MockHeroStorage()
    }

    override func tearDown() {
        systemUnderTest = nil
        super.tearDown()
    }

    func testInsert() {
        let hero = TestUtilities.testHero
        do {
            try systemUnderTest.save(hero)
            let recordFromDb = try systemUnderTest.fetch().filter { $0.id == hero.id }.first
            XCTAssertTrue(recordFromDb == hero)
        } catch {
            XCTFail("Error occured \(error)")
        }
    }

    // TODO: Add more tests
}

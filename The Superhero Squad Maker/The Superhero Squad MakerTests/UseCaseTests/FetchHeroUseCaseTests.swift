//
//  FetchHeroUseCaseTests.swift
//  The Superhero Squad MakerTests
//
//  Created by Abin Baby on 19.02.24.
//

import Combine
@testable import The_Superhero_Squad_Maker
import XCTest

final class FetchHeroUseCaseTests: XCTestCase {
    
    var useCase: FetchHeroUseCase!
    var mockStorage: MockHeroStorage!
    private var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        mockStorage = MockHeroStorage()
        useCase = FetchHeroUseCase(storageManager: mockStorage)
        cancellables = []
    }

    override func tearDown() {
        useCase = nil
        mockStorage = nil
        cancellables = nil
        super.tearDown()
    }

    func testFetchHeroSuccess() {
        // Given
        let expectedHero = TestUtilities.testHero
        mockStorage.heroes = [expectedHero]

        // When
        let expectation = XCTestExpectation(description: "Fetch hero successfully")

        useCase.execute(id: "1")
            .sink(receiveValue: { hero in
                // Then
                XCTAssertEqual(hero, expectedHero)
                expectation.fulfill()
            })
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }

    func testFetchHeroFailure() {
        // Given
        mockStorage.heroes.removeAll()

        // When
        let expectation = XCTestExpectation(description: "Fetch hero failed and returned nil")

        useCase.execute(id: "unknown")
            .sink(receiveValue: { hero in
                // Then
                XCTAssertNil(hero)
                expectation.fulfill()
            })
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }
}

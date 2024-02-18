//
//  FetchSquadUseCaseTests.swift
//  The Superhero Squad MakerTests
//
//  Created by Abin Baby on 18.02.24.
//

import Combine
@testable import The_Superhero_Squad_Maker
import XCTest

final class FetchSquadUseCaseTests: XCTestCase {

    private var cancellables: Set<AnyCancellable>!
    private var mockHeroStorage: MockHeroStorage!
    private var fetchSquadUseCase: FetchSquadUseCase!

    override func setUp() {
        super.setUp()
        mockHeroStorage = MockHeroStorage()
        fetchSquadUseCase = FetchSquadUseCase(
            storageManager: mockHeroStorage
        )
        cancellables = []
    }

    override func tearDown() {
        mockHeroStorage = nil
        cancellables = nil
        fetchSquadUseCase = nil
        super.tearDown()
    }

    func testFetchSquadUseCase_Success() {
        // Expectation for async result
        let expectation = XCTestExpectation(description: "Fetch squad successfully")

        mockHeroStorage.heroes = [
            TestUtilities.testHero
        ]

        fetchSquadUseCase.execute()
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure:
                        XCTFail("Expected success, received failure")
                    }
                },
                receiveValue: { heroes in
                    XCTAssertEqual(heroes.count, 1)
                    XCTAssertEqual(heroes.first?.name, "Test Hero")
                    expectation.fulfill()
                })
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }

    func testFetchSquadUseCase_Failure() {
        // Expectation for async result
        let expectation = XCTestExpectation(description: "Fetch squad fails with error")

        mockHeroStorage.error = ClientError.persistanceError

        fetchSquadUseCase.execute()
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        XCTFail("Expected failure, received success")
                    case .failure(let error):
                        XCTAssertNotNil(error)
                        expectation.fulfill()
                    }
                },
                receiveValue: { _ in
                    XCTFail("Expected failure, received success")
                }
            )
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }
}

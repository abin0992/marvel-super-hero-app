//
//  HomeViewModelTests.swift
//  The Superhero Squad MakerTests
//
//  Created by Abin Baby on 18.02.24.
//

import Combine
@testable import The_Superhero_Squad_Maker
import XCTest

@MainActor
final class HomeViewModelTests: XCTestCase {
    private var systemUnderTest: HomeViewModel!
    private var mockFetchHeroListUseCase: MockFetchHeroListUseCase!
    private var mockFetchSquadUseCase: MockFetchSquadUseCase!
    private var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        mockFetchHeroListUseCase = MockFetchHeroListUseCase()
        mockFetchSquadUseCase = MockFetchSquadUseCase()
        systemUnderTest = HomeViewModel(
            fetchHeroListUseCase: mockFetchHeroListUseCase,
            fetchSquadUseCase: mockFetchSquadUseCase
        )
        cancellables = []
    }

    override func tearDown() {
        systemUnderTest = nil
        mockFetchHeroListUseCase = nil
        mockFetchSquadUseCase = nil
        cancellables = nil
        super.tearDown()
    }

    func testViewModelInitialStateIsLoading() {
        XCTAssertEqual(systemUnderTest.state, .loading)
    }

    func testViewModelFetchesHerosOnInitialization() {
        let expectation = XCTestExpectation(description: "Fetch crypto coins on initialization")

        systemUnderTest.$state
            .dropFirst() // Drop the initial loading state
            .sink { [mockFetchHeroListUseCase] state in
                if case .data(let heros) = state {
                    XCTAssertEqual(heros.count, mockFetchHeroListUseCase?.stubbedHeros.data.results.count)
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        mockFetchHeroListUseCase.sendHeros()

        wait(for: [expectation], timeout: 1.0)
    }

    func testViewModelHandlesErrorState() {
        let expectation = XCTestExpectation(description: "Handle error state")

        systemUnderTest.$state
            .dropFirst() // Drop the initial loading state
            .sink { state in
                if case .error(let error) = state {
                    XCTAssertEqual(error, ClientError.generic)
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        mockFetchHeroListUseCase.sendError()

        wait(for: [expectation], timeout: 1.0)
    }

    func testViewModelRetryFetchesHeros() {
        let expectation = XCTestExpectation(description: "Retry fetches heros")

        // Simulate an error first
        mockFetchHeroListUseCase.sendError()

        // Then retry
        systemUnderTest.didTapRetry.send()

        systemUnderTest.$state
            .sink { state in
                if case .data(let heros) = state {
                    XCTAssertFalse(heros.isEmpty)
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        mockFetchHeroListUseCase.sendHeros()

        wait(for: [expectation], timeout: 1.0)
    }

    // TODO: Add more tests
}

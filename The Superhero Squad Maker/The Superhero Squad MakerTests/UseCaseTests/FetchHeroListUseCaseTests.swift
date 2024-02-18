//
//  FetchHeroListUseCaseTests.swift
//  The Superhero Squad MakerTests
//
//  Created by Abin Baby on 18.02.24.
//

import Combine
@testable import The_Superhero_Squad_Maker
import XCTest

final class FetchHeroListUseCaseTests: XCTestCase {

    private var mockHeroService: MockHeroService!
    private var fetchHeroListUseCase: FetchHeroListUseCase!
    private var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        mockHeroService = MockHeroService()
        fetchHeroListUseCase = FetchHeroListUseCase(
            heroService: mockHeroService
        )
        cancellables = []
    }

    override func tearDown() {
        mockHeroService = nil
        fetchHeroListUseCase = nil
        cancellables = nil
        super.tearDown()
    }

    func testExecuteSuccess() {
        // Given
        let stubbedResponse = TestUtilities.load(
            fromJSON: "hero_list_sample",
            type: HeroListResponse.self
        )

        let responsePublisher = Just(stubbedResponse)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()

        mockHeroService.stubbedFetchHeroListResult = responsePublisher

        // When
        let expectation = XCTestExpectation(description: "execute should return success with list of heros")

        fetchHeroListUseCase.execute(offset: "")
            .sink(
                receiveValue: { domainResult in
                    if case .success(let heroResponse) = domainResult {
                        XCTAssertEqual(heroResponse.data.results.count, stubbedResponse.data.results.count)
                        XCTAssertEqual(heroResponse.data.results.first?.id, stubbedResponse.data.results.first?.id)
                        expectation.fulfill()
                    }
                }
            )
            .store(in: &cancellables)

        // Then
        wait(for: [expectation], timeout: 1.0)
    }

    func testExecuteFailure() {
        // Given
        let responsePublisher = Fail<HeroListResponse, Error>(error: ClientError.networkError)
            .eraseToAnyPublisher()
        mockHeroService.stubbedFetchHeroListResult = responsePublisher

        // When
        let expectation = XCTestExpectation(description: "execute should return error")
        fetchHeroListUseCase
            .execute(offset: "")
            .sink(
                receiveValue: { domainResult in
                    if case .error(let error) = domainResult, case ClientError.networkError = error {
                        expectation.fulfill()
                    }
                }
            )
            .store(in: &cancellables)

        // Then
        wait(for: [expectation], timeout: 1.0)
    }
}

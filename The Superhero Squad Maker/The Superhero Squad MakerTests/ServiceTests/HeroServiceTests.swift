//
//  HeroServiceTests.swift
//  The Superhero Squad MakerTests
//
//  Created by Abin Baby on 18.02.24.
//

import Combine
@testable import The_Superhero_Squad_Maker
import XCTest

final class HeroServiceTests: XCTestCase {
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        cancellables = []
    }

    func testFetchHeroList_Success() {
        let httpClient = MockHTTPClient()
        let service = HeroService(httpClient: httpClient)

        // Simulate successful network response
        let stubbedResponseData = TestUtilities.data(fromJSON: "hero_list_sample")

        httpClient.responseData = stubbedResponseData

        let expectation = XCTestExpectation(description: "Fetch hero list succeeds")

        service.fetchHeroList(offset: "0")
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        XCTFail("Request failed with error: \(error)")
                    }
                    expectation.fulfill()
                },
                receiveValue: { response in
                    XCTAssertEqual(50, response.data.results.count)
                }
            )
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }

    func testFetchHeroList_Failure() {
        let httpClient = MockHTTPClient()
        let service = HeroService(httpClient: httpClient)

        // Simulate network error
        httpClient.error = URLError(.notConnectedToInternet)

        let expectation = XCTestExpectation(description: "Fetch hero list fails")

        service.fetchHeroList(offset: "0")
            .sink(
                receiveCompletion: { completion in
                    if case .failure = completion {
                        expectation.fulfill()
                    } else {
                        XCTFail("Expected failure but got success")
                    }
                },
                receiveValue: { _ in
                    XCTFail("Expected failure but got success")
                }
            )
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }

    override func tearDown() {
        cancellables.forEach { $0.cancel() }
        super.tearDown()
    }
}

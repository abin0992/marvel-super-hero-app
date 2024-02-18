//
//  EditSquadUseCaseTests.swift
//  The Superhero Squad MakerTests
//
//  Created by Abin Baby on 18.02.24.
//

import Combine
@testable import The_Superhero_Squad_Maker
import XCTest

final class EditSquadUseCaseTests: XCTestCase {

    private var cancellables: Set<AnyCancellable>!
    private var mockHeroStorage: MockHeroStorage!

    override func setUp() {
        super.setUp()
        mockHeroStorage = MockHeroStorage()
        cancellables = []
    }

    func testExecute_AddsHeroToSquad() {
        let expectation = XCTestExpectation(description: "Adds hero to squad")
        let useCase = EditSquadUseCase(storageManager: mockHeroStorage)
        let hero = Hero(
            id: 1,
            name: "Test Hero",
            heroDescription: "",
            thumbnail: Thumbnail(
                path: "",
                thumbnailExtension: ""
            )
        )

        useCase.execute(hero: hero, isInSquad: false)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished: break
                    case .failure(let error): XCTFail("Operation failed with error: \(error)")
                    }
                    expectation.fulfill()
                },
                receiveValue: { _ in })
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }

    func testExecute_RemovesHeroFromSquad() {
        let expectation = XCTestExpectation(description: "Removes hero from squad")
        let useCase = EditSquadUseCase(storageManager: mockHeroStorage)
        let hero = Hero(
            id: 1,
            name: "Test Hero",
            heroDescription: "",
            thumbnail: Thumbnail(
                path: "",
                thumbnailExtension: ""
            )
        )

        useCase.execute(hero: hero, isInSquad: true)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished: break
                    case .failure(let error): XCTFail("Operation failed with error: \(error)")
                    }
                    expectation.fulfill()
                },
                receiveValue: { _ in }
            )
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }

    func testExecute_FailsWithError() {
        let expectation = XCTestExpectation(description: "Operation fails with error")
        mockHeroStorage.shouldThrowError = true
        let useCase = EditSquadUseCase(storageManager: mockHeroStorage)
        let hero = Hero(
            id: 1,
            name: "Test Hero",
            heroDescription: "",
            thumbnail: Thumbnail(
                path: "",
                thumbnailExtension: ""
            )
        )

        useCase.execute(hero: hero, isInSquad: false)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished: XCTFail("Expected failure, but operation completed successfully")
                    case .failure: expectation.fulfill()
                    }
                },
                receiveValue: { _ in XCTFail("Expected failure, but received success") }
            )
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }

    override func tearDown() {
        cancellables.forEach { $0.cancel() }
        super.tearDown()
    }
}

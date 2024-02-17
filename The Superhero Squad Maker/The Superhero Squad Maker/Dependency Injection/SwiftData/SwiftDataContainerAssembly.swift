//
//  SwiftDataContainerBuilder.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 15.02.24.
//

import Foundation
import SwiftData
import Swinject

@MainActor
final class DataContainerAssembly {

    static let all: [Assembly] = [
        SwiftDataContainerAssembly()
    ]
}

@MainActor
final class SwiftDataContainerAssembly: Assembly {

    private var modelContainer: ModelContainer

    private lazy var context: ModelContext = {
        return modelContainer.mainContext
    }()

    init() {
        do {
            modelContainer = try ModelContainer(
                for: HeroPersistentModel.self,
                configurations: ModelConfiguration()
            )
        } catch {
            fatalError("Failed to create ModelContainer for Hero.")
        }
    }

    func assemble(container: Container) {
        container.register(HeroStorageProtocol.self) { _ in
            HeroPersistenceManager(context: self.context)
        }
    }
}

//
//  ServiceAssembly.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 12.02.24.
//

import Foundation
import Swinject

final class ServiceAssembly {

    static let all: [Assembly] = [
        HeroServiceAssembly()
    ]

}

final class HeroServiceAssembly: Assembly {

    func assemble(container: Container) {
        container.register(HeroFetchable.self) { resolver in
            HeroService(
                httpClient: resolver.resolve(HTTPClientProtocol.self)!
            )
        }
    }

}

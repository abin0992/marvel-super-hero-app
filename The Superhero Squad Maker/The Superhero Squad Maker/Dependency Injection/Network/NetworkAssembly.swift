//
//  NetworkAssembly.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 12.02.24.
//

import Foundation
import Swinject

final class NetworkAssembly {

    static let all: [Assembly] = [
        HTTPAssembly()
    ]

}

final class HTTPAssembly: Assembly {

    func assemble(container: Container) {
        container.register(HTTPClientProtocol.self) { _ in
            HTTPClient()
        }
    }

}

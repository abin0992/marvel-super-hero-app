//
//  ApplicationCoordinator.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 12.02.24.
//

import Combine
import SwiftUI
import Swinject
import UIKit

final class ApplicationCoordinator: Coordinator {

    private var childCoordinators = [Coordinator]()

  //  private let resolver: Resolver
    private let window: UIWindow

    init(
     //   resolver: Resolver,
        window: UIWindow
    ) {
     //   self.resolver = resolver
        self.window = window
    }

    func start() {
//        let resolverEnvironment = ResolverEnvironment()
//
//        guard let homeCoordinator = resolver.resolve(
//            HomeCoordinator.self,
//            argument: resolverEnvironment
//        ) else {
//            return
//        }
//
//        homeCoordinator.start()

        let homeCoordinator = HomeCoordinator()
        homeCoordinator.start()
        childCoordinators = [homeCoordinator]
        window.rootViewController = homeCoordinator.rootViewController
    }
}

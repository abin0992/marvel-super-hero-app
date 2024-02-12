//
//  SceneDelegate.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 12.02.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var applicationCoordintor: ApplicationCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let applicationCoordintor = ApplicationCoordinator(
              //  resolver: DependencyManager.shared.container,
                window: window
            )
            applicationCoordintor.start()

            self.applicationCoordintor = applicationCoordintor
            window.makeKeyAndVisible()
        }
    }

}

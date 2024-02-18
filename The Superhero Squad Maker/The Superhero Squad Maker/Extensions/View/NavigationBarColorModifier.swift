//
//  NavigationBarColorModifier.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 13.02.24.
//

import SwiftUI

struct NavigationBarColorModifier: ViewModifier {
    var backgroundColor: UIColor
    var foregroundColor: UIColor

    func body(content: Content) -> some View {
        content
            .onAppear {
                let appearance = UINavigationBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = backgroundColor
                appearance.titleTextAttributes = [.foregroundColor: foregroundColor]
                appearance.largeTitleTextAttributes = [.foregroundColor: foregroundColor]

                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().compactAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
                UINavigationBar.appearance().tintColor = foregroundColor
            }
    }
}

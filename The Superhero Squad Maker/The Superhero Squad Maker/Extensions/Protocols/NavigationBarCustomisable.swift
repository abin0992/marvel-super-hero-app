//
//  NavigationBarCustomisable.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 13.02.24.
//

import UIKit

protocol NavigationBarCustomisable {
    func configureNavigationBarAppearance(color: UIColor)
    func resetNavigationBarAppearance()
}

extension NavigationBarCustomisable {

    func configureNavigationBarAppearance(color: UIColor) {
        let appearance = UINavigationBarAppearance()
       // appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = color
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    func resetNavigationBarAppearance() {
        UINavigationBar.appearance().standardAppearance = UINavigationBarAppearance()
        UINavigationBar.appearance().compactAppearance = UINavigationBarAppearance()
        UINavigationBar.appearance().scrollEdgeAppearance = UINavigationBarAppearance()
    }
    
//    func configureNavigationBar() {
//        // Create an appearance object
//        let appearance = UINavigationBarAppearance()
//
//        // Customize the title text attributes
//        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//
//        // Customize the large title text attributes, if needed
//        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//
//        // Customize the background color
//        appearance.backgroundColor = UIColor(Color.greyDark)  // Set your desired color
//
//        // Apply the appearance to the navigation bar
//        rootViewController.navigationBar.standardAppearance = appearance
//        rootViewController.navigationBar.scrollEdgeAppearance = appearance
//        rootViewController.navigationBar.compactAppearance = appearance // Optional, for compact environments
//
//        // If you want to change the bar button items color
//        rootViewController.navigationBar.tintColor = .white
//    }
}

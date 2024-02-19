//
//  AppConfiguration.swift
//  CryptoPrice
//
//  Created by Abin Baby on 08.02.24.
//

import Foundation

struct AppConfiguration {
    static let apiBaseURL: String = "gateway.marvel.com"
    static let publicKey: String = "d162dde64b243ad1c342eaf5a3d9ada2"
    static let privateKey: String = "8f8fa0e7fe8b333dc0ab726c84ed01991b4e7fd4"
    static let paginationLimit: String = "50"
}

enum Margins {
    static let xSmall: CGFloat = 2.0
    static let small: CGFloat = 8.0
    static let medium: CGFloat = 16.0
    static let mediumLarge: CGFloat = 32.0
    static let large: CGFloat = 48.0
    static let xLarge: CGFloat = 64.0
}

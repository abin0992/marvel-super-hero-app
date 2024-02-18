//
//  Security.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 12.02.24.
//

import CryptoKit
import Foundation

enum Hashing {
    enum MD5 {
        static func hashHexString(from string: String) -> String {
            let digest = Insecure.MD5.hash(data: Data(string.utf8))
            return digest
                .map { String(format: "%02hhx", $0) }
                .joined()
        }
    }
}

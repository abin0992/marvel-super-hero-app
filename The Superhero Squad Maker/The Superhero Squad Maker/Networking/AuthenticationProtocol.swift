//
//  AuthenticationProtocol.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 12.02.24.
//

import Foundation

protocol AuthenticationProtocol {
    func headerHash(timeStamp: String) -> String
}

extension AuthenticationProtocol {

    func headerHash(timeStamp: String) -> String {
        let hash = "\(timeStamp)\(AppConfiguration.privateKey)\(AppConfiguration.publicKey)"
        return Hashing.MD5.hashHexString(from: hash)
    }
}

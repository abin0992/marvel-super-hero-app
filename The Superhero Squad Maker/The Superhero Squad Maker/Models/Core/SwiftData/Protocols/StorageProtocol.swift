//
//  StorageProtocol.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 15.02.24.
//

import Foundation

protocol StorageProtocol {
    associatedtype EntityType

    init(_ entity: EntityType)

    func getModel() -> EntityType
}

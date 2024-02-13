//
//  Array+Extensions.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 13.02.24.
//

import Foundation

extension Array where Element: Identifiable {
    func isLastItem(_ item: Element) -> Bool {
        guard let itemIndex = lastIndex(where: { $0.id == item.id }) else {
            return false
        }
        return itemIndex == count - 1
    }
}

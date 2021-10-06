//
//  Collection+Safe.swift
//  Albertos
//
//  Created by Simon Rofe on 25/9/21.
//

import Foundation

extension Collection {
    /// Returns the element at the given index if it is within range, othereise nil.
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

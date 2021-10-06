//
//  MenuSection+Fixture.swift
//  AlbertosTests
//
//  Created by Simon Rofe on 6/10/21.
//

import Foundation
@testable import Albertos

extension MenuSection {
    static func fuxture(
        category: String = "a category",
        items: [MenuItem] = [.fixture()]
    ) -> MenuSection {
        MenuSection(
            category: category,
            items: items)
    }
}

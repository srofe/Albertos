//
//  MenuItem+Fixture.swift
//  AlbertosTests
//
//  Created by Simon Rofe on 25/9/21.
//

import Foundation
@testable import Albertos

extension MenuItem {
    static func fixture(
        category: String = "category",
        name: String = "name") -> MenuItem {
        MenuItem(category: category, name: name)
    }
}

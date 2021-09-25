//
//  MenuGroupingTests.swift
//  MenuGroupingTests
//
//  Created by Simon Rofe on 22/9/21.
//

import XCTest
@testable import Albertos

class MenuGroupingTests: XCTestCase {

    func testEmptyMenu_ReturnsEmptySections() {
        let menu = [MenuItem]()
        let sections = groupMenuByCategory(menu)
        XCTAssertTrue(sections.isEmpty, "Menu grouping for a menu with no items shall have no groups.")
    }

    func test_MenuWithOneCategory_ReturnsOneSection() {
        let menu = [
            MenuItem(category: "pastas"),
            MenuItem(category: "pastas")
        ]
        let sections = groupMenuByCategory(menu)
        XCTAssertEqual(sections.count, 1, "Menu grouping for a menu with items in one category shall have one group.")
    }
}

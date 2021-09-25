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

    func test_MenuWithOneCategory_ReturnsOneSection() throws {
        let menu = [
            MenuItem(category: "pastas", name: "name"),
            MenuItem(category: "pastas", name: "other name")
        ]
        let sections = groupMenuByCategory(menu)
        XCTAssertEqual(sections.count, 1, "Menu grouping for a menu with items in one category shall have one group.")
        let section = try XCTUnwrap(sections.first)
        XCTAssertEqual(section.items.count, 2)
        XCTAssertEqual(section.items.first?.name, "name")
        XCTAssertEqual(section.items.last?.name, "other name")
    }

    func test_MenuWithManyCategories_returnsOneSectionPerCategory() {
        let menu = [
            MenuItem(category: "pastas", name: "a pasta"),
            MenuItem(category: "drinks", name: "a drink"),
            MenuItem(category: "pastas", name: "another pasta"),
            MenuItem(category: "desserts", name: "a dessert"),
        ]
        let sections = groupMenuByCategory(menu)
        XCTAssertEqual(sections.count, 3, "Menu grouping for a menu with items in several categories shall shall return items grouped by those categories.")
        XCTAssertEqual(sections[safe: 0]?.category, "pastas")
        XCTAssertEqual(sections[safe: 1]?.category, "drinks")
        XCTAssertEqual(sections[safe: 2]?.category, "desserts")
    }
}

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
            MenuItem.fixture(category: "pastas", name: "name"),
            MenuItem.fixture(category: "pastas", name: "other name")
        ]
        let sections = groupMenuByCategory(menu)
        XCTAssertEqual(sections.count, 1, "Menu grouping for a menu with items in one category shall have one group.")
        let section = try XCTUnwrap(sections.first)
        XCTAssertEqual(section.items.count, 2, "A menu section shall have the number of items that corresponde to the group they are in.")
        XCTAssertEqual(section.items.first?.name, "name", "A menu section shall contain the items that belong to that section. First item of two.")
        XCTAssertEqual(section.items.last?.name, "other name", "A menu section shall contain the items that belong to that section. Second item of two.")
    }

    func test_MenuWithManyCategories_returnsOneSectionPerCategory() {
        let menu = [
            MenuItem.fixture(category: "pastas"),
            MenuItem.fixture(category: "drinks"),
            MenuItem.fixture(category: "pastas"),
            MenuItem.fixture(category: "desserts"),
        ]
        let sections = groupMenuByCategory(menu)
        XCTAssertEqual(sections.count, 3, "Menu grouping for a menu with items in several categories shall return items grouped by those categories.")
        XCTAssertEqual(sections[safe: 0]?.category, "pastas", "Each menu section shall have a category name corresponding to the cateory of the menu items. First item of three.")
        XCTAssertEqual(sections[safe: 1]?.category, "drinks", "Each menu section shall have a category name corresponding to the cateory of the menu items. Second item of three.")
        XCTAssertEqual(sections[safe: 2]?.category, "desserts", "Each menu section shall have a category name corresponding to the cateory of the menu items. Third item of three.")
    }
}

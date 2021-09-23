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
        XCTAssertTrue(sections.isEmpty, "A menu with no items shall have no sections.")
    }
}

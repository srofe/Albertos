//
//  MenuItemTests.swift
//  AlbertosTests
//
//  Created by Simon Rofe on 8/10/21.
//

import XCTest
@testable import Albertos

class MenuItemTests: XCTestCase {

    func test_WhenDecodedFromJSON_DataHasAllTheInputProperties() throws {
        let json = #"{ "name": "a name", "category": "a category", "spicy": true, "price": 0.0 }"#
        let data = try XCTUnwrap(json.data(using: .utf8))
        let item = try JSONDecoder().decode(MenuItem.self, from: data)
        XCTAssertEqual(item.name, "a name")
        XCTAssertEqual(item.category, "a category")
        XCTAssertEqual(item.spicy, true)
        XCTAssertEqual(item.price, 0.0)
    }

    func test_WhenDecodedFromJSON_DataHasAllTheInputProperties_jsonFile() throws {
        let data = try dataFromJSONFileNamed("menu_item")
        let item = try JSONDecoder().decode(MenuItem.self, from: data)
        XCTAssertEqual(item.name, "a name")
        XCTAssertEqual(item.category, "a category")
        XCTAssertEqual(item.spicy, true)
        XCTAssertEqual(item.price, 0.0)
    }
}

extension MenuItemTests {
    func dataFromJSONFileNamed(_ name: String) throws -> Data {
        let url = try XCTUnwrap(Bundle(for: type(of: self)).url(forResource: name, withExtension: "json"))
        return try Data(contentsOf: url)
    }
}

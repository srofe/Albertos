//
//  MenuRowViewModelTests.swift
//  AlbertosTests
//
//  Created by Simon Rofe on 6/10/21.
//

import XCTest
@testable import Albertos

class MenuRowViewModelTests: XCTestCase {

    func test_WhenItmeIsNotSpicy_TextIsItemNameOnly() {
        let item: MenuItem = .fixture(name: "name", spicy: false)
        let viewModel = MenuRow.ViewModel(item: item)
        XCTAssertEqual(viewModel.text, "name", "A menu item which is not spicy shall display its name only.")
    }

    func test_WhenItemIsSpicy_TextIsItemWithChilliEmoji() {
        let item: MenuItem = .fixture(name: "name", spicy: true)
        let viewModel = MenuRow.ViewModel(item: item)
        XCTAssertEqual(viewModel.text, "name 🌶", "A menu item which is spicy shall display its name with a chilli emoji appended.")
    }
}

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
        XCTAssertEqual(viewModel.text, "name")
    }
}

//
//  MenuListViewModelTests.swift
//  AlbertosTests
//
//  Created by Simon Rofe on 6/10/21.
//

import XCTest
@testable import Albertos

class MenuListViewModelTests: XCTestCase {

    func test_CallsGivenGroupingFunction() {
        var called = false
        let inputSections = [MenuSection.fixture()]
        let spyClosure: ([MenuItem]) -> [MenuSection] = { items in
            called = true
            return inputSections
        }
        let viewModel = MenuList.ViewModel(menu: [.fixture()], menuGrouping: spyClosure)
        let sections = viewModel.sections
        XCTAssertTrue(called, "Instantiating a MenuList.ViewModel shall call the closure passed to it.")
        XCTAssertEqual(sections, inputSections, "Instantiating a MenuList.ViewModel shall set the sections property created by the closure.")
    }
}

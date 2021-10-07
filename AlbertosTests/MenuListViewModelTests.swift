//
//  MenuListViewModelTests.swift
//  AlbertosTests
//
//  Created by Simon Rofe on 6/10/21.
//

import XCTest
import Combine
@testable import Albertos

class MenuListViewModelTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()

    func test_CallsGivenGroupingFunction() throws {
        try XCTSkipIf(true, "Skipping this for now, keeping it to reuse part of the code later on.")
        var called = false
        let inputSections = [MenuSection.fixture()]
        let spyClosure: ([MenuItem]) -> [MenuSection] = { items in
            called = true
            return inputSections
        }
        let viewModel = MenuList.ViewModel(menuFetching: MenuFetchingPlaceholder(), menuGrouping: spyClosure)
        let sections = viewModel.sections
        XCTAssertTrue(called, "Instantiating a MenuList.ViewModel shall call the closure passed to it.")
        XCTAssertEqual(try sections.get(), inputSections, "Instantiating a MenuList.ViewModel shall set the sections property created by the closure.")
    }

    func test_WhenFetchingStarts_PublishersEmptyMenu() throws {
        let viewModel = MenuList.ViewModel(menuFetching: MenuFetchingStub(returning: .success([.fixture()])))
        let sections = try viewModel.sections.get()
        XCTAssertTrue(sections.isEmpty, "When menu fetching starts the view model shall publish an empty array of sections.")
    }

    func test_WhenFetchingSucceeds_PublishesSectionsBuiltFromReceivedMenuAndGroupingClosure() {
        var receivedMenu: [MenuItem]?
        let expectedSections = [MenuSection.fixture()]
        let expectedMenu = [MenuItem.fixture()]
        let spyClosure: ([MenuItem]) -> [MenuSection] = { items in
            receivedMenu = items
            return expectedSections
        }
        let menuFetchingStub = MenuFetchingStub(returning: .success(expectedMenu))
        let viewModel = MenuList.ViewModel(menuFetching: menuFetchingStub, menuGrouping: spyClosure)
        let expectation = XCTestExpectation(description: "Publishes sections built from received menu and given grouping closure.")
        viewModel
            .$sections
            .dropFirst()
            .sink { value in
                guard case .success(let sections) = value else {
                    return XCTFail("Expected a successful Result, got \(value).")
                }
                XCTAssertEqual(receivedMenu, expectedMenu, "When menu fetching is successful, the grouping closure shall be called with the received menu.")
                XCTAssertEqual(sections, expectedSections, "When menu fetching is successful, the grouping closure shall return the grouped sections.")
                expectation.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 1)
    }
}

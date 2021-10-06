//
//  MenuList.ViewModel.swift
//  Albertos
//
//  Created by Simon Rofe on 6/10/21.
//

import SwiftUI
import Combine

extension MenuList {
    class ViewModel: ObservableObject {
        @Published private(set) var sections: [MenuSection]
        private var cancellables = Set<AnyCancellable>()

        init(
            menuFetching: MenuFetching,
            menuGrouping: @escaping ([MenuItem]) -> [MenuSection] = groupMenuByCategory
        ) {
            sections = []
            menuFetching
                .fetchMenu()
                .sink(receiveCompletion: { _ in },
                      receiveValue: { [weak self] value in
                    self?.sections = menuGrouping(value)
                })
                .store(in: &cancellables)
        }
    }
}

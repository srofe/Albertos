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
        @Published private(set) var sections: Result<[MenuSection], Error> = .success([])
        private var cancellables = Set<AnyCancellable>()

        init(
            menuFetching: MenuFetching,
            menuGrouping: @escaping ([MenuItem]) -> [MenuSection] = groupMenuByCategory
        ) {
            menuFetching
                .fetchMenu()
                .sink(receiveCompletion: { _ in },
                      receiveValue: { [weak self] value in
                    self?.sections = .success(menuGrouping(value))
                })
                .store(in: &cancellables)
        }
    }
}

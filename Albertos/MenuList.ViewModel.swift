//
//  MenuList.ViewModel.swift
//  Albertos
//
//  Created by Simon Rofe on 6/10/21.
//

import SwiftUI

extension MenuList {
    class ViewModel: ObservableObject {
        @Published private(set) var sections: [MenuSection]

        init(
            menu: [MenuItem],
            menuGrouping: @escaping ([MenuItem]) -> [MenuSection] = groupMenuByCategory
        ) {
            self.sections = menuGrouping([])
        }
    }
}

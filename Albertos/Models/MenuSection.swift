//
//  MenuSection.swift
//  Albertos
//
//  Created by Simon Rofe on 23/9/21.
//

import Foundation

struct MenuSection {
    let category: String
    let items: [MenuItem]
}

extension MenuSection: Identifiable {
    var id: String { category }
}

extension MenuSection: Equatable {}

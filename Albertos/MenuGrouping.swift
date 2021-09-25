//
//  MenuGrouping.swift
//  Albertos
//
//  Created by Simon Rofe on 22/9/21.
//

import Foundation

func groupMenuByCategory(_ menu: [MenuItem]) -> [MenuSection] {
    return Dictionary(grouping: menu, by: { $0.category })
        .map{ key, value in MenuSection(category: key, items: value)}
        .sorted { $0.category > $1.category }
}

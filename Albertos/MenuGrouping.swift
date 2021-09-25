//
//  MenuGrouping.swift
//  Albertos
//
//  Created by Simon Rofe on 22/9/21.
//

import Foundation

func groupMenuByCategory(_ menu: [MenuItem]) -> [MenuSection] {
    guard menu.isEmpty == false else { return [] }
    return [MenuSection(items: menu)]
}

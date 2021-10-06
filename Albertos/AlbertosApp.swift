//
//  AlbertosApp.swift
//  Albertos
//
//  Created by Simon Rofe on 22/9/21.
//

import SwiftUI

@main
struct AlbertosApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MenuList(viewModel: MenuList.ViewModel(menuFetching: MenuFetchingPlaceholder()))
                    .navigationTitle("Alberto's 🇮🇹")
            }
        }
    }
}

let menu = [
    MenuItem(category: "starters", name: "Caprese Salad", spicy: false, price: 12.0),
    MenuItem(category: "starters", name: "Arancini Balls", spicy: false, price: 16.0),
    MenuItem(category: "pastas", name: "Penne all'Arrabbiata", spicy: true, price: 26.0),
    MenuItem(category: "pastas", name: "Spaghetti Carbonara", spicy: false, price: 28.0),
    MenuItem(category: "drinks", name: "Water", spicy: false, price: 0.0),
    MenuItem(category: "drinks", name: "Red Wine", spicy: false, price: 9.0),
    MenuItem(category: "desserts", name: "Tiramisù", spicy: false, price: 15.0),
    MenuItem(category: "desserts", name: "Crema Catalana", spicy: false, price: 14.50)
]

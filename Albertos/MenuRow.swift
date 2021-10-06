//
//  MenuRow.swift
//  Albertos
//
//  Created by Simon Rofe on 6/10/21.
//

import SwiftUI

struct MenuRow: View {
    let item: MenuItem

    var body: some View {
        Text(item.name)
    }
}

struct MenuRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuRow(item: MenuItem(category: "pastas", name: "Spaghetti Carbonara", spicy: false, price: 28.0))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

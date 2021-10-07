//
//  MenuRow.swift
//  Albertos
//
//  Created by Simon Rofe on 6/10/21.
//

import SwiftUI

struct MenuRow: View {
    let viewModel: ViewModel

    var body: some View {
        Text(viewModel.text)
    }
}

struct MenuRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuRow(viewModel: MenuRow.ViewModel(item: menu.first!))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

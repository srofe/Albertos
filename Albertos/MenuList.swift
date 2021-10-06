//
//  MenuList.swift
//  Albertos
//
//  Created by Simon Rofe on 22/9/21.
//

import SwiftUI

struct MenuList: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        List {
            ForEach(viewModel.sections) { section in
                Section(header: Text(section.category)) {
                    ForEach(section.items) { item in
                        MenuRow(viewModel: MenuRow.ViewModel(item: item))
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MenuList(viewModel: MenuList.ViewModel(menuFetching: MenuFetchingPlaceholder()))
    }
}

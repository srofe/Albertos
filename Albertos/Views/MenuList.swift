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
        switch viewModel.sections {
        case .success(let sections):
            List {
                ForEach(sections) { section in
                    Section(header: Text(section.category)) {
                        ForEach(section.items) { item in
                            MenuRow(viewModel: MenuRow.ViewModel(item: item))
                        }
                    }
                }
            }
        case .failure(let error):
            Text("An error occurred:")
            Text(error.localizedDescription).italic()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MenuList(viewModel: MenuList.ViewModel(menuFetching: MenuFetchingPlaceholder()))
    }
}

//
//  MenuRow.ViewModel.swift
//  Albertos
//
//  Created by Simon Rofe on 6/10/21.
//

import SwiftUI

extension MenuRow {
    struct ViewModel {
        let text: String
        init(item: MenuItem) {
            text = item.name
        }
    }
}

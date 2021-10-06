//
//  MenuFetchingPlaceholder.swift
//  Albertos
//
//  Created by Simon Rofe on 6/10/21.
//

import Combine
import Foundation

class MenuFetchingPlaceholder: MenuFetching {

    func fetchMenu() -> AnyPublisher<[MenuItem], Error> {
        return Future { $0(.success(menu)) }
        .delay(for: 0.5, scheduler: RunLoop.main)
        .eraseToAnyPublisher()
    }
}

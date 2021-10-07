//
//  MenuFetchingStub.swift
//  AlbertosTests
//
//  Created by Simon Rofe on 7/10/21.
//

import Foundation
import Combine
@testable import Albertos

class MenuFetchingStub: MenuFetching {

    let result: Result<[MenuItem], Error>

    init(returning result: Result<[MenuItem], Error>) {
        self.result = result
    }

    func fetchMenu() -> AnyPublisher<[MenuItem], Error> {
        result.publisher
            .delay(for: 0.1, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

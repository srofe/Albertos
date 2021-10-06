//
//  MenuFetching.swift
//  Albertos
//
//  Created by Simon Rofe on 6/10/21.
//

import Combine

protocol MenuFetching {
    func fetchMenu() -> AnyPublisher<[MenuItem], Error>
}

//
//  UsersAPI.swift
//  SwiftUIExample
//
//  Created by Alexandr Glushchenko on 01.10.2021.
//

import Foundation
import Combine

enum UsersAPIError: Error {
    case unknown
}

protocol UsersAPIType {
    func getUsers() -> AnyPublisher<[User], UsersAPIError>
}

class UsersAPI: UsersAPIType {
    func getUsers() -> AnyPublisher<[User], UsersAPIError> {
        Just(UsersAPI.dumpUsers)
            .eraseAndSetError(to: UsersAPIError.self)
    }

    static var dumpUsers: [User] = [
        .init(id: UUID(), name: "Alexandr", surname: "Bolekov", birthday: Date(), views: 30),
        .init(id: UUID(), name: "Bob", surname: "Klot", birthday: Date(), views: 13),
        .init(id: UUID(), name: "Berg", surname: "Urg", birthday: Date(), views: 150),
    ]
}

extension Publisher {
    public func eraseAndSetError<E>(to failureType: E.Type) -> AnyPublisher<Output, E> where Self.Failure == Never, E : Error {
        self
            .setFailureType(to: failureType.self)
            .eraseToAnyPublisher()
    }
}

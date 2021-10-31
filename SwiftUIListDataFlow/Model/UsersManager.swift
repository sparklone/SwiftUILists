//
//  UsersService.swift
//  SwiftUIExample
//
//  Created by Alexandr Glushchenko on 31.10.2021.
//

import Foundation
import Combine

class UsersManager: ObservableObject {
    @Published var users: [User] = []

    private var cancellables = Set<AnyCancellable>()

    private let usersApi: UsersAPIType

    init(usersApi: UsersAPIType) {
        self.usersApi = usersApi
    }

    func getUsers() {
        usersApi.getUsers()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                    case let .failure(error):
                        print("Error get users: \(error)")
                    case .finished:
                        print("Success get users")
                }
            } receiveValue: { users in
                self.users = users
            }
            .store(in: &cancellables)
    }

    func removeUsers(indexSet: IndexSet) {
        DispatchQueue.main.async {
            self.users.remove(atOffsets: indexSet)
        }
    }

    func remove(user: User) throws {
        DispatchQueue.main.async { [self] in
            print("try to remove \(user)")
            guard let index = users.firstIndex(where: { $0.id == user.id }) else {
                print("can't find user: \(user)")
                return
            }
            users.remove(at: index)
        }
    }

    func remove(at index: Int) {
        DispatchQueue.main.async { [self] in
            users.remove(at: index)
        }
    }

    func set(name: String, to user: User) throws {
        DispatchQueue.main.async { [self] in
            print("try to set name \(name) for \(user)")
            guard let index = users.firstIndex(where: { $0.id == user.id }) else {
                print("can't find user: \(user)")
                return
            }
            users[index].name = name
        }
    }
}

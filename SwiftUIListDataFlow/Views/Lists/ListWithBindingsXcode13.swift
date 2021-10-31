//
//  ListWithBindingsXcode13.swift
//  SwiftUIListDataFlow
//
//  Created by Alexandr Glushchenko on 31.10.2021.
//

import SwiftUI

enum UserViewKind {
    case useCache
    case checkDeletion
    case readonly
    case editable
}
struct ListWithBindingsXcode13: View {
    let userViewKind: UserViewKind
    @EnvironmentObject var usersManager: UsersManager

    var body: some View {
        List {
            ForEach($usersManager.users) { $user in
                let _ = print(user)
                switch userViewKind {
                    case .useCache:
                        NavigationLink(
                            destination: UserViewWithBindingReadonlyCheckDeletionCached(user: $user),
                            label: { Text("\(user.name), \(user.surname)") }
                        )
                    case .checkDeletion:
                        NavigationLink(
                            destination: UserViewWithBindingReadonlyCheckDeletion(user: $user),
                            label: { Text("\(user.name), \(user.surname)") }
                        )
                    case .readonly:
                        NavigationLink(
                            destination: UserViewWithBindingReadonly(user: $user),
                            label: { Text("\(user.name), \(user.surname)") }
                        )
                    case .editable:
                        NavigationLink(
                            destination: EditableUserInfoView(user: $user),
                            label: { Text("\(user.name), \(user.surname)") }
                        )
                }
            }
            .onDelete { indexSet in
                usersManager.removeUsers(indexSet: indexSet)
            }
        }
    }
}

struct ListWithBindingsXcode13_Previews: PreviewProvider {
    static var previews: some View {
        ListWithBindingsXcode13(userViewKind: .checkDeletion)
    }
}

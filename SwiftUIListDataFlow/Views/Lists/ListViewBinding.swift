//
//  ListViewBinding.swift
//  SwiftUIListDataFlow
//
//  Created by Alexandr Glushchenko on 31.10.2021.
//

import SwiftUI

struct ListViewBinding: View {
    @EnvironmentObject var usersManager: UsersManager

    var body: some View {
        List {
            ForEach($usersManager.users) { index, user in
                NavigationLink(
                    destination: UserViewWithBindingReadonly(user: $usersManager.users[index]),
                    label: { Text(usersManager.users[index].name) }
                )
            }
            .onDelete { indexSet in
                usersManager.removeUsers(indexSet: indexSet)
            }
        }
    }
}

struct ListViewBinding_Previews: PreviewProvider {
    static var previews: some View {
        ListViewBinding()
    }
}

//
//  ListViewConstants.swift
//  SwiftUIListDataFlow
//
//  Created by Alexandr Glushchenko on 31.10.2021.
//

import SwiftUI

struct ListViewConstants: View {
    let checkDeletion: Bool
    @EnvironmentObject var usersManager: UsersManager

    var body: some View {
        List {
            ForEach(usersManager.users) { user in
                let _ = print(user)
                if checkDeletion {
                    NavigationLink(
                        destination: UserViewCheckDeletion(user: user),
                        label: { Text(user.name) }
                    )
                } else {
                    NavigationLink(
                        destination: UserView(user: user),
                        label: { Text(user.name) }
                    )
                }

            }
            .onDelete { indexSet in
                usersManager.removeUsers(indexSet: indexSet)
            }
        }
        .navigationBarTitle("Constants list", displayMode: .inline)
    }
}

struct ListViewConstants_Previews: PreviewProvider {
    static var previews: some View {
        ListViewConstants(checkDeletion: true)
    }
}

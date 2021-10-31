//
//  ListViewIndicies.swift
//  SwiftUIListDataFlow
//
//  Created by Alexandr Glushchenko on 31.10.2021.
//

import SwiftUI

struct ListViewIndices: View {
    @EnvironmentObject var usersManager: UsersManager
    
    var body: some View {
        List {
            ForEach(usersManager.users.indices, id: \.self) { index in
                NavigationLink(
                    destination: UserView(user: usersManager.users[index]),
                    label: { Text(usersManager.users[index].name) }
                )
            }
            .onDelete { indexSet in
                usersManager.removeUsers(indexSet: indexSet)
            }
        }
        .navigationBarTitle("Constants list", displayMode: .inline)
        .navigationBarItems(
            trailing: Button("Reload") {
                usersManager.getUsers()
            }
        )
    }
}

struct ListViewIndices_Previews: PreviewProvider {
    static var previews: some View {
        ListViewIndices()
    }
}

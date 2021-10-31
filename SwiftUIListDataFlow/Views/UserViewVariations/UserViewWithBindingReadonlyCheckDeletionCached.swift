//
//  UserViewWithBindingReadonlyCheckDeletionCached.swift
//  SwiftUIListDataFlow
//
//  Created by Alexandr Glushchenko on 31.10.2021.
//

import SwiftUI

struct UserViewWithBindingReadonlyCheckDeletionCached: View {
    @Binding var user: User
    @EnvironmentObject var usersManager: UsersManager

    @State private var userWasDeleted: Bool = false
    @Environment(\.presentationMode) var presentationMode

    @State private var cachedUser: User = User(id: .init(), name: "", surname: "", birthday: Date(), views: 0)

    var body: some View {
        UserInfoView(user: user)
            .withEditNavigationButtons(user: user, usersManager: usersManager)
            .onAppear {
                cachedUser = user
            }
            .alert(isPresented: $userWasDeleted, content: {
                Alert(
                    title: Text("User was deleted"),
                    dismissButton: Alert.Button.cancel(Text("OK"), action: {
                        presentationMode.wrappedValue.dismiss()
                    })
                )
            })
//            .onChange(of: usersManager.users) { users in
//                print("UserViewWithBindingReadonlyCheckDeletionCached (onChange) users update: \(users), for user \(cachedUser)")
//                if !users.map(\.id).contains(cachedUser.id) {
//                    userWasDeleted = true
//                }
//            }
            .onReceive(usersManager.$users) { users in
                print("UserViewCheckDeletion (onReceive) users update: \(users)")
                if !users.map(\.id).contains(cachedUser.id) {
                    userWasDeleted = true
                }
            }
    }
}

struct UserViewWithBindingReadonlyCheckDeletionCached_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserViewWithBindingReadonlyCheckDeletionCached(user: .constant(UsersAPI.dumpUsers[0]))
        }
    }
}

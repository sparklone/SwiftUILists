//
//  UserViewWithBindingReadonlyCheckDeletion.swift
//  SwiftUIListDataFlow
//
//  Created by Alexandr Glushchenko on 31.10.2021.
//

import SwiftUI

struct UserViewWithBindingReadonlyCheckDeletion: View {
    @Binding var user: User
    @EnvironmentObject var usersManager: UsersManager

    @State private var userWasDeleted: Bool = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        UserInfoView(user: user)
            .withEditNavigationButtons(user: user, usersManager: usersManager)
            .alert(isPresented: $userWasDeleted, content: {
                Alert(
                    title: Text("User was deleted"),
                    dismissButton: Alert.Button.cancel(Text("OK"), action: {
                        presentationMode.wrappedValue.dismiss()
                    })
                )
            })
//            .onChange(of: usersManager.users) { users in
//
//                // iOs 15 crash
//
//                print("UserViewWithBindingReadonlyCheckDeletion (onChange) users update: \(users), for user \(user)")
//                if !users.map(\.id).contains(user.id) {
//                    userWasDeleted = true
//                }
//            }
            .onReceive(usersManager.$users) { users in
                print("UserViewWithBindingReadonlyCheckDeletion (onReceive) users update: \(users)")
                if !users.map(\.id).contains(user.id) {
                    userWasDeleted = true
                }
            }
    }
}

struct UserViewWithBindingReadonlyCheckDeletion_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserViewWithBindingReadonlyCheckDeletion(user: .constant(UsersAPI.dumpUsers[0]))
        }
    }
}

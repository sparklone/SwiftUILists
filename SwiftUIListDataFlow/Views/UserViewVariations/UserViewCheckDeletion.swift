//
//  UserViewCheckDeletion.swift
//  SwiftUIListDataFlow
//
//  Created by Alexandr Glushchenko on 31.10.2021.
//

import SwiftUI

struct UserViewCheckDeletion: View {
    let user: User
    @EnvironmentObject var usersManager: UsersManager

    @State private var userWasDeleted: Bool = false
    @Environment(\.presentationMode) var presentationMode

//    init(user: User) {
//        print("init: UserViewCheckDeletion with user \(user)")
//        self.user = user
//    }

    var body: some View {
        UserInfoView(user: user)
            .withEditNavigationButtons(user: user, usersManager: usersManager)
//            .onAppear {
//                print("UserViewCheckDeletion appear with user: \(user)")
//            }
            .alert(isPresented: $userWasDeleted, content: {
                Alert(
                    title: Text("User was deleted"),
                    dismissButton: Alert.Button.cancel(Text("OK"), action: {
                        presentationMode.wrappedValue.dismiss()
                    })
                )
            })
            .onChange(of: usersManager.users) { users in
                print("UserViewCheckDeletion (onChange) users update: \(users)")
                if !users.map(\.id).contains(user.id) {
                    userWasDeleted = true
                }
            }
//            .onReceive(usersManager.$users) { users in
//                print("UserViewCheckDeletion (onReceive) users update: \(users)")
//                if !users.map(\.id).contains(user.id) {
//                    userWasDeleted = true
//                }
//            }
    }
}

struct UserViewCheckDeletion_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserViewCheckDeletion(user: UsersAPI.dumpUsers[0])
        }
    }
}

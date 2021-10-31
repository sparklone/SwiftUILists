//
//  UserView.swift
//  SwiftUIExample
//
//  Created by Alexandr Glushchenko on 01.10.2021.
//

import SwiftUI

struct UserView: View {
    let user: User
    @EnvironmentObject var usersManager: UsersManager

//    init(user: User) {
//        print("init: UserView with user \(user)")
//        self.user = user
//    }

    var body: some View {
        UserInfoView(user: user)
            .withEditNavigationButtons(user: user, usersManager: usersManager)
            .onAppear {
                print("UserView appear with user: \(user)")
            }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserView(user: UsersAPI.dumpUsers[0])
        }
    }
}

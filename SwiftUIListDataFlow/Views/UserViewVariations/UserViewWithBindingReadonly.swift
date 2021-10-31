//
//  UserViewWithBinding.swift
//  SwiftUIExample
//
//  Created by Alexandr Glushchenko on 01.10.2021.
//

import SwiftUI

struct UserViewWithBindingReadonly: View {
    @Binding var user: User
    @EnvironmentObject var usersManager: UsersManager

    var body: some View {
        UserInfoView(user: user)
            .withEditNavigationButtons(user: user, usersManager: usersManager)
    }
}

struct UserViewWithBinding_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserViewWithBindingReadonly(user: .constant(UsersAPI.dumpUsers[0]))
        }
    }
}

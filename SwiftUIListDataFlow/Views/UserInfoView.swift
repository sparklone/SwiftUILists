//
//  UsersInfoView.swift
//  SwiftUIListDataFlow
//
//  Created by Alexandr Glushchenko on 31.10.2021.
//

import SwiftUI

struct UserInfoView: View {
    let user: User
    var body: some View {
        VStack {
            Text("Name: \(user.name)")
            Text("Surname: \(user.surname)")
            Text("Views: \(user.views)")
        }
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView(user: UsersAPI.dumpUsers[0])
    }
}

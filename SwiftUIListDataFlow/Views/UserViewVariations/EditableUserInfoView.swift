//
//  EditableUserInfoView.swift
//  SwiftUIListDataFlow
//
//  Created by Alexandr Glushchenko on 31.10.2021.
//

import SwiftUI

struct EditableUserInfoView: View {
    @Binding var user: User
    @EnvironmentObject var usersManager: UsersManager

    @State private var userWasDeleted: Bool = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            TextField("Name", text: $user.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Surname", text: $user.surname)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
        .withEditNavigationButtons(user: user, usersManager: usersManager)
        .alert(isPresented: $userWasDeleted, content: {
            Alert(
                title: Text("User was deleted"),
                dismissButton: Alert.Button.cancel(Text("OK"), action: {
                    presentationMode.wrappedValue.dismiss()
                })
            )
        })
        .onReceive(usersManager.$users) { users in
            print("UserViewWithBindingReadonlyCheckDeletion (onReceive) users update: \(users)")
            if !users.map(\.id).contains(user.id) {
                userWasDeleted = true
            }
        }
    }
}

struct EditableUserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditableUserInfoView(user: .constant(UsersAPI.dumpUsers[0]))
        }
    }
}

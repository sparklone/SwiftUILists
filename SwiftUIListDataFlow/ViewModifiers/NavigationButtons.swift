//
//  NavigationButtons.swift
//  SwiftUIListDataFlow
//
//  Created by Alexandr Glushchenko on 31.10.2021.
//

import SwiftUI

struct NavigationButtons: ViewModifier  {
    let user: User
    let usersManager: UsersManager

    var deleteButton: some View {
        Button("Delete") {
            do {
                print("view, try to remove \(user)")
                try usersManager.remove(user: user)
            } catch {
                print(error)
            }
        }
    }

    var updateButton: some View {
        Button("Update") {
            do {
                print("view, try to update \(user)")
                try usersManager.set(name: "New name", to: user)
            } catch {
                print(error)
            }
        }
    }

    func body(content: Content) -> some View {
        content
            .navigationBarItems(
                trailing:
                    HStack {
                        deleteButton
                        updateButton
                    }
            )
    }
}

extension View {
    func withEditNavigationButtons(user: User, usersManager: UsersManager) -> some View {
        modifier(NavigationButtons(user: user, usersManager: usersManager))
    }
}

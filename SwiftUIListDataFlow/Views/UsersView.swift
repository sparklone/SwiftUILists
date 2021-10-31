//
//  UsersView.swift
//  SwiftUIExample
//
//  Created by Alexandr Glushchenko on 01.10.2021.
//

import SwiftUI

struct UsersView: View {
    private static var firstRun = true
    @EnvironmentObject var usersManager: UsersManager
    var body: some View {
        List {
            Section(header: Text("Read only")) {
                NavigationLink(destination: ListViewConstants(checkDeletion: false)) {
                    Text("Simple list without bindings")
                }
                NavigationLink(destination: ListViewConstants(checkDeletion: true)) {
                    Text("Simple list without bindings, check deletion")
                }
                NavigationLink(destination: UserViewCheckDeletion(user: usersManager.users.first ?? UsersAPI.dumpUsers[1])) {
                    Text("Just user: \((usersManager.users.first ?? UsersAPI.dumpUsers[1]).name)")
                }
                NavigationLink(destination: ListViewIndices()) {
                    Text("Simple list without bindings, indices")
                }
            }
            Section(header: Text("With bindings, Readonly")) {
                NavigationLink(destination: ListViewBinding()) {
                    Text("List with custom bindings")
                }
                NavigationLink(destination: ListWithBindingsXcode13(userViewKind: .readonly)) {
                    Text("List with Xcode 13 bindings, no check deletion")
                }
                NavigationLink(destination: ListWithBindingsXcode13(userViewKind: .checkDeletion)) {
                    Text("List with Xcode 13 bindings, check deletion")
                }
                NavigationLink(destination: ListWithBindingsXcode13(userViewKind: .useCache)) {
                    Text("List with Xcode 13 bindings, check deletion, cache users")
                }
            }
            Section(header: Text("With bindings, Editable")) {
                NavigationLink(destination: ListWithBindingsXcode13(userViewKind: .editable)) {
                    Text("List with Xcode 13 bindings, editable")
                }
            }
        }
        .navigationBarTitle("List of lists =)", displayMode: .inline)
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}

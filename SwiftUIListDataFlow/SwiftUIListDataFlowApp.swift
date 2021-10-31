//
//  SwiftUIListDataFlowApp.swift
//  SwiftUIListDataFlow
//
//  Created by Alexandr Glushchenko on 02.10.2021.
//


import SwiftUI

@main
struct SwiftUIListDataFlowApp: App {
    let usersManager = UsersManager(usersApi: UsersAPI())
    var body: some Scene {
        WindowGroup {
            NavigationView {
                UsersView()
            }
//            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(usersManager)
            .onAppear {
                usersManager.getUsers()
            }
        }
    }
}

//
//  User.swift
//  SwiftUIExample
//
//  Created by Alexandr Glushchenko on 31.10.2021.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id: UUID
    var name: String
    var surname: String
    var birthday: Date
    var views: Int
}

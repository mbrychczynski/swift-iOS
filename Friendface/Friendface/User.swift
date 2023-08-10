//
//  User.swift
//  Friendface
//
//  Created by Mateusz Brychczynski on 04/05/2023.
//

import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]

    static let example = User(id: UUID(), isActive: true, name: "Mateusz Brychczynski", age: 27, company: "Hacking with Swift Student", email: "test@email.com", address: "22 Random address", about: "SwiftUI student", registered: Date.now, tags: ["swift", "swiftui", "dogs"], friends: [])
}

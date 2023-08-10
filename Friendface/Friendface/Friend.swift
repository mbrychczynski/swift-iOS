//
//  Friend.swift
//  Friendface
//
//  Created by Mateusz Brychczynski on 04/05/2023.
//

import Foundation

struct Friend: Identifiable, Codable {
    let id: UUID
    let name: String
}

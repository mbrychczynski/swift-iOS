//
//  String-EmptyChecking.swift
//  Bookworm
//
//  Created by Mateusz Brychczynski on 03/05/2023.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
